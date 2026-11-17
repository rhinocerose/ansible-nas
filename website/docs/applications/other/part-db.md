---
title: "Part-DB"
---

Homepage: <https://part-db.de/>

Part-DB is an open source inventory management system for electronic components. It keeps track of parts, categories, footprints, manufacturers, storage locations and prices, and integrates with KiCad.

## Usage

Set `partdb_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The Part-DB web interface can be found at <http://ansible_nas_host_or_ip:10091>.

## Specific Configuration

Part-DB uses a SQLite database stored in `{{ docker_home }}/partdb/db`, so no separate database container is required. Uploads and generated media are stored alongside it.

The initial administrator password is set by `partdb_initial_admin_password` and defaults to `changeme`. Change it after the first login. The application secret can be regenerated with `openssl rand -hex 32` and set through `partdb_app_secret`; changing it logs out all existing sessions.

`partdb_base_currency` should be set before any prices are entered, as it cannot be changed afterwards.
