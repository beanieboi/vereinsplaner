# Vereinsplaner

Vereinsplaner is a small Rails application for managing a sports club's members and their membership fees. It is built for and used by TFC Leipzig.

## Features

- **Members**: contact data, membership type (full, discounted, passive, support), start and end dates, membership fee, and an uploaded application form per member.
- **Payments**: record fee payments per member; each member gets a payment standing (good, neutral, bad) derived from their last payment.
- **Statistics**: member age distribution formatted for the Landessportbund (LSB) report.
- **Admin area**: manage user accounts; only users with the admin flag can access it.
- **Audit trail**: changes to members and payments are versioned with PaperTrail.

The user interface is in German.

## Stack

- Ruby 4.0, Rails 8.1, Puma
- SQLite for the database
- Active Storage for application forms (local disk in development, S3 in production)
- Bootstrap and Sprockets for the frontend
- Pundit for authorization, `has_secure_password` for authentication

## Getting started

```sh
bin/setup
```

This installs gems, prepares the SQLite database and starts the server on http://localhost:3000. See [docs/installation.md](docs/installation.md) for the full guide, including creating the first admin user and deploying with Docker.

## Development

```sh
bin/dev          # start the server
bin/rails test   # run the test suite
bin/ci           # lint, security scans and tests, as run in CI
```

## Further documentation

- [docs/installation.md](docs/installation.md): local setup, first user, production deployment to the runtime (Nix flake, GitHub Actions) or with Docker
- [docs/self-hosted-sqlite-runbook.md](docs/self-hosted-sqlite-runbook.md): operating, backing up and restoring the production instance
- [docs/heroku-to-self-hosted-sqlite-plan.md](docs/heroku-to-self-hosted-sqlite-plan.md): migration notes from Heroku and PostgreSQL

## License

MIT, see [LICENSE](LICENSE).
