# Self-hosted SQLite runbook

## Coolify configuration

- Run a single app container with `RAILS_ENV=production`.
- Mount persistent storage at `/app/storage`.
- Set `DATABASE_URL=sqlite3:/app/storage/production.sqlite3`.
- Set `RAILS_MASTER_KEY` and `SECRET_KEY_BASE` as Coolify secrets.
- Keep `WEB_CONCURRENCY` unset or set to `1`; do not run multiple replicas against the same SQLite file.
- Configure the existing S3 Active Storage credentials. Current production uses S3 via `config.active_storage.service = :amazon`.

Run migrations against the mounted database file before Puma starts.

## Backup

There is not yet a `script/backup_sqlite` helper in the repo. Until one is added, run the backup command from the app container or a one-off Coolify command:

```sh
mkdir -p /app/storage/backups
sqlite3 /app/storage/production.sqlite3 ".backup '/app/storage/backups/vereinsplaner.sqlite3'"
tar -C /app/storage/backups -czf /app/storage/backups/vereinsplaner.sqlite3.tar.gz vereinsplaner.sqlite3
gpg --symmetric --cipher-algo AES256 /app/storage/backups/vereinsplaner.sqlite3.tar.gz
```

Copy the generated `*.gpg` archive off-server after the command completes.

Back up these separately:

- S3 bucket used for application forms
- `RAILS_MASTER_KEY`
- Coolify secrets and environment variables
- deployment configuration

## Restore check

Before trusting backups:

1. Copy a backup to a temporary restore path.
2. Decrypt and extract it.
3. Boot a one-off app container against the restored SQLite file.
4. Verify login, member list, member show, payment list, and application-form download.
