# Self-hosted SQLite runbook

Production runs as the application `vereinsplaner` on the runtime (`ssh apps runtime --help`). The runtime starts one process with `RAILS_ENV=production`, the SQLite database at `$STATE_DIR/production.sqlite` (`/var/lib/runtime-apps/vereinsplaner`), and `RAILS_MASTER_KEY` from its secrets. Never run a second copy against the same database file.

Uploaded application forms are not in the database: every Active Storage blob lives in the S3 bucket `vereinsplaner-production` (`eu-central-1`). The S3 credentials are in `config/credentials.yml.enc`, so `RAILS_MASTER_KEY` is the only secret the runtime needs.

## Operating

```sh
ssh apps runtime status vereinsplaner
ssh apps runtime logs vereinsplaner -n 200
ssh apps runtime diagnose verein.tfc-leipzig.com
ssh apps runtime generations vereinsplaner
ssh apps runtime rollback vereinsplaner        # previous generation, no CI needed
ssh apps runtime restart vereinsplaner
```

A deploy that does not start within 10 seconds is reverted automatically. Migrations run on start (`rails db:prepare` in `bin/runtime-start`) and count against that budget; the current boot takes about 1.5 seconds.

## Backup

The state directory streams out as a gzip tar (ADR 0024). Stop the application first for a consistent SQLite snapshot:

```sh
ssh apps runtime stop vereinsplaner
ssh apps runtime state-dir export vereinsplaner production.sqlite > vereinsplaner-$(date +%F).tar.gz
ssh apps runtime start vereinsplaner
```

Keep the archive encrypted and off the VM; it contains member data. Back up separately: the S3 bucket, `config/master.key`, and the runtime settings (`env list`, `limits show`, hostnames), which are small enough to recreate by hand.

## Restore

The archive's paths are relative to `STATE_DIR`, so an export imports to the same place. The application must exist and be stopped:

```sh
ssh apps runtime stop vereinsplaner
ssh apps runtime state-dir import vereinsplaner --yes --replace < vereinsplaner-YYYY-MM-DD.tar.gz
ssh apps runtime start vereinsplaner
```

Without `--yes` the import only summarises what it would do. To restore a backup from the old Coolify volume, extract `production.sqlite` from it and repack it alone: `tar -czf state.tar.gz production.sqlite`.

## Restore check

Before trusting a backup, run it against a copy:

1. Extract `production.sqlite` from the archive into an empty directory and run `sqlite3 production.sqlite "PRAGMA integrity_check"`.
2. Boot the app against the copy: `RAILS_ENV=production DATABASE_URL=sqlite3:/path/to/production.sqlite bin/rails runner 'puts Member.count'`, with `config/master.key` in place.
3. For a full check, build the flake and start it as the runtime would: `PORT=3001 STATE_DIR=/path/to/dir TMPDIR=/tmp RAILS_MASTER_KEY=... ./result/bin/vereinsplaner`, then verify login, member list, member show, payment list, and an application-form download.
