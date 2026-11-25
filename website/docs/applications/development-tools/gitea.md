---
title: "Gitea"
---

Homepage: <https://gitea.io/>

Gitea is a painless self-hosted Git service.

## Usage

Set `gitea_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The Gitea web interface can be found at <http://ansible_nas_host_or_ip:3001>.

## Specific Configuration

Before enabling Gitea, set `gitea_db_password` and `gitea_db_root_password` in your inventory, ideally from [Ansible Vault](../../further-configuration/ansible-vault.md). They only take effect when the database is first created. If you installed Gitea before these variables existed, both are currently `gitea`.
