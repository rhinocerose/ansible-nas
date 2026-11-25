---
title: "Firefly III"
---

Homepage: <https://firefly-iii.org/>

Firefly III is a self-hosted financial manager. It can help you keep track of expenses, income, budgets and everything in between. It supports credit cards, shared household accounts and savings accounts. It's pretty fancy. You should use it to save and organize money.

## Usage

Set `firefly_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The Firefly III web interface can be found at <http://ansible_nas_host_or_ip:8066>.

## Specific Configuration

Before enabling Firefly III, set these in your inventory, ideally from [Ansible Vault](../../further-configuration/ansible-vault.md):

- `firefly_db_password` and `firefly_db_root_password`: database passwords. These only take effect when the database is first created.
- `firefly_app_key`: the key Firefly III encrypts data with. It must be exactly 32 characters. Don't change it on an existing install, or previously encrypted data becomes unreadable.

If you installed Firefly III before these variables existed, the values in use are the old defaults: `firefly` for both passwords and the `firefly_app_key` default in `roles/firefly/defaults/main.yml`.
