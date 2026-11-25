# Miniflux

Homepage: <https://miniflux.app/>

Miniflux is a minimalist and opinionated feed reader.

## Usage

Set `miniflux_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The Miniflux web interface can be found at <http://ansible_nas_host_or_ip:8070>.

## Specific Configuration

An admin user will be created with the username and password of `miniflux_admin_username` and `miniflux_admin_password` respectively (default `admin` / `supersecure`). Change the password before enabling Miniflux.

The database password is set with `miniflux_db_password`. It only takes effect when the database is first created. If you installed Miniflux before this variable existed, it's currently `supersecure`.

Set both passwords from [Ansible Vault](../../further-configuration/ansible-vault.md) rather than in plain text.
