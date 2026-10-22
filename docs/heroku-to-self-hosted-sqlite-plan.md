# Heroku to self-hosted SQLite migration plan

## Goal

Move Vereinsplaner off Heroku onto a small self-hosted server and replace PostgreSQL with SQLite to reduce operational complexity.

The target deployment should stay small:

- one Rails/Puma web process
- one persistent SQLite database file
- one configured Active Storage backend for membership application forms
- automated off-server backups
- simple deploy and rollback steps

## Current app facts

- The app is currently configured for PostgreSQL in `config/database.yml`.
- `Gemfile` still uses `pg`; `sqlite3` has not been added yet.
- `Procfile` still defines Heroku-style `web` and `release` processes.
- `config/environments/production.rb` uses Active Storage service `:amazon`.
- The only current Active Storage attachment in app code is `Member#application_form`.
- Active Storage will stay on S3 for the SQLite migration.
- Containerization is not part of the database migration.
- The app no longer exposes tag, document, or message features.
- Historical migrations have been squashed into `db/migrate/20260507123000_create_current_schema.rb`.
- The squashed baseline represents the current desired app schema without PostgreSQL-only array columns, GIN indexes, `inet` columns, unused feature tables, or the PostgreSQL `plpgsql` extension entry.
- The squashed baseline also contains guarded cleanup so it can run on an existing PostgreSQL database without recreating existing core tables.

## Updated migration direction

Because the removed features are no longer part of the app, do not preserve their PostgreSQL-specific storage shapes for SQLite. The squashed baseline now drops the dead schema before the cutover instead.

The compatibility release should now be much smaller:

- keep Heroku and PostgreSQL as the production source of truth
- keep `pg` and the current PostgreSQL `database.yml`
- deploy the squashed baseline migration
- let the baseline remove `members.tags`, `tags`, `documents`, `messages`, and the malformed PaperTrail artifact column if they exist
- let the baseline convert `users.current_sign_in_ip` and `users.last_sign_in_ip` from `inet` to `string` if those columns already exist
- verify the app on Heroku before attempting SQLite

After this release, the live PostgreSQL database should contain only tables that the current app uses, and the remaining application schema should be representable in SQLite.

## SQLite schema policy

Historical migrations have been replaced by one current-schema baseline. For SQLite:

- build the SQLite database from the baseline schema
- load converted production data into that database
- ensure the `schema_migrations` table records `20260507123000`
- only run new post-cutover migrations against SQLite

This avoids failures from old migrations that used PostgreSQL-only constructs such as `t.inet`, array columns, and GIN indexes.

## Target architecture

Use the local Coolify instance with a single Rails app process:

- one Rails/Puma app container
- Coolify-managed reverse proxy and TLS
- persistent mounted directory for SQLite
- SQLite database at `/app/storage/production.sqlite3`
- off-server backups for the database and upload storage

Recommended persistent path:

- container mount: `/app/storage`
- SQLite database: `/app/storage/production.sqlite3`
- SQLite backup staging: `/app/storage/backups`

The critical rule is that the database file must live under a persistent Coolify volume or bind mount. If it is written inside the disposable container filesystem, it can be lost on redeploy.

## Active Storage

SQLite migration does not automatically move uploaded application forms.

Active Storage will stay on S3 for the SQLite migration. Keep the existing bucket and credentials, confirm the self-hosted app has the same Active Storage credentials, and back up the S3 bucket separately from the SQLite file.

## Deployment constraints

Recommended Coolify setup:

- one app service only
- no app replicas
- `RAILS_ENV=production`
- `RAILS_MASTER_KEY` set as a Coolify secret
- `SECRET_KEY_BASE` generated once and set as a Coolify secret
- `DATABASE_URL=sqlite3:/app/storage/production.sqlite3`
- persistent storage mounted at `/app/storage`
- `WEB_CONCURRENCY` unset or set to `1`

SQLite constraints:

- Run one Rails container against the SQLite file.
- Do not mount the same SQLite file into multiple app containers.
- Keep Puma workers at 0 or 1. Multiple threads are acceptable for this app, but SQLite still has one writer at a time.
- Run migrations against the mounted database before serving traffic.

## Backups

Minimum backup set:

- SQLite database
- S3 bucket used by Active Storage
- `RAILS_MASTER_KEY`
- Coolify environment variables and secrets
- deployment configuration needed to recreate the app

Recommended SQLite backup flow:

1. Run `sqlite3 /app/storage/production.sqlite3 ".backup '/app/storage/backups/vereinsplaner.sqlite3'"`.
2. Archive the copied database.
3. Encrypt the archive.
4. Copy it off-server.
5. Keep daily backups for 14 days and monthly backups for 12 months.
6. Test a restore before migration day and again after production cutover.

Backups are not complete unless application-form uploads are also recoverable.

## Implementation phases

### Phase 1: Heroku cleanup release

- Keep PostgreSQL in production.
- Keep `pg`; do not switch adapters yet.
- Deploy the squashed baseline migration.
- Confirm it cleans up removed feature schema and converts user sign-in IP columns without recreating existing core tables.
- Run the test suite against PostgreSQL.
- Deploy to Heroku and let release migrations run.
- Manually verify:
  - login and logout
  - dashboard
  - member list
  - member create/edit/show
  - member application form download
  - payment list/create/delete
  - statistics
  - admin user management

### Phase 2: Local SQLite proof of concept

- Pull a fresh Heroku PostgreSQL backup.
- Restore it locally.
- Apply the squashed baseline migration if the backup predates the cleanup release.
- Create a SQLite-compatible schema from the current baseline.
- Export data from PostgreSQL and import it into SQLite.
- Populate `schema_migrations` in SQLite with `20260507123000`.
- Add `sqlite3` locally and test the app against the converted SQLite database.
- Run smoke tests for the same flows as Phase 1.

Expected application data tables after cleanup:

- `active_storage_attachments`
- `active_storage_blobs`
- `active_storage_variant_records`
- `countries`
- `members`
- `membership_types`
- `payments`
- `users`
- `versions`

### Phase 3: Data migration tooling

Create repeatable scripts or documented commands for:

- fetching a fresh Heroku PostgreSQL backup
- restoring the backup locally
- applying the squashed baseline when needed
- creating the SQLite database
- loading schema and data
- populating `schema_migrations` with `20260507123000`
- verifying row counts per retained table
- checking Active Storage blob references

The final migration should be scripted enough that the dress rehearsal and production cutover use the same steps.

### Phase 4: SQLite app changes

- Add the `sqlite3` gem.
- Update `config/database.yml` so production can use `DATABASE_URL=sqlite3:/app/storage/production.sqlite3`.
- Keep development/test database choices explicit.
- Ensure the container starts with migrations against the mounted SQLite database.
- Decide whether to keep or remove Heroku `Procfile` entries after the new deployment is live.

### Phase 5: Coolify setup

- Create a Coolify application from this repository.
- Configure persistent storage at `/app/storage`.
- Configure production secrets:
  - `RAILS_ENV=production`
  - `RAILS_MASTER_KEY`
  - `SECRET_KEY_BASE`
  - `DATABASE_URL=sqlite3:/app/storage/production.sqlite3`
- Configure the existing S3 Active Storage credentials.
- Deploy the app image.
- Confirm the app can read and write the mounted SQLite path.
- Confirm health checks and logs in Coolify.

### Phase 6: Dress rehearsal

- Pull a fresh Heroku backup.
- Convert it to SQLite with the migration tooling.
- Upload the SQLite database to Coolify persistent storage.
- Deploy under a temporary domain or hosts-file override.
- Run smoke tests.
- Test SQLite backup creation.
- Test restore onto a separate temporary path.
- Confirm application-form uploads still work.
- Measure the downtime needed for the final migration.

### Phase 7: Final migration

1. Announce a maintenance window.
2. Put the Heroku app into maintenance mode.
3. Take a final Heroku PostgreSQL backup.
4. Convert the final backup to SQLite.
5. Upload the SQLite database to Coolify persistent storage.
6. Start the Coolify app.
7. Run final migrations if needed.
8. Smoke test key flows.
9. Switch DNS.
10. Keep the Heroku app and PostgreSQL database untouched for rollback until confidence is high.

### Phase 8: Post-migration cleanup

- Monitor app logs and disk usage.
- Verify daily backups are running.
- Perform one restore test from production backup.
- Remove Heroku-specific configuration when rollback is no longer needed.
- Remove PostgreSQL dependency from the app after the SQLite deployment is proven.
- Document operational commands in `README.md`.
- After a waiting period, shut down Heroku resources.

## Rollback plan

Until Heroku is decommissioned:

1. Keep the Heroku app and PostgreSQL database intact.
2. If the self-hosted app fails during cutover, point DNS back to Heroku.
3. Disable writes on the self-hosted app before rollback if any real users wrote data there.
4. Decide whether to manually replay those writes or discard them.

Rollback is easiest if the final cutover happens during a short maintenance window with Heroku in maintenance mode.

## Open questions

- What hostname should production use after the move?
- Should Coolify persistent storage be a named Docker volume or a host bind mount?
- Which off-server backup destination should be used?

## Recommended next step

Deploy the squashed baseline while still on PostgreSQL, verify Heroku, then build the SQLite proof of concept from a fresh Heroku backup.
