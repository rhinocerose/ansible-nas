# Ansible Vault

Passwords and API tokens shouldn't sit in plain text in your inventory. [Ansible Vault](https://docs.ansible.com/ansible/latest/vault_guide/index.html) encrypts them so the file can be committed safely, and Ansible decrypts it in memory when the playbook runs.

Run these commands wherever you run Ansible-NAS from (usually the server itself).

## Layout

Use a folder for your group vars instead of a single file. Ansible loads every file inside it:

```text
inventories/<your_inventory>/group_vars/<group>/
├── vars.yml     # plain text settings
└── vault.yml    # encrypted secrets
```

In `vars.yml`, point each secret at a `vault_`-prefixed variable:

```yaml
nextcloud_sql_password: "{{ vault_nextcloud_sql_password }}"
```

and define the real value in `vault.yml`:

```yaml
vault_nextcloud_sql_password: "a-long-random-password"
```

The prefix keeps the variable name searchable in plain text and makes it obvious where the value comes from.

## Set Up

1. Create a vault password file outside the repository and back the password up somewhere safe. If you lose it, the vault can't be decrypted.

    ```bash
    openssl rand -base64 32 > ~/.ansible-nas-vault-pass
    chmod 600 ~/.ansible-nas-vault-pass
    echo 'export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible-nas-vault-pass' >> ~/.bashrc
    source ~/.bashrc
    ```

2. Create the encrypted vault and add your secrets:

    ```bash
    ansible-vault create inventories/<your_inventory>/group_vars/<group>/vault.yml
    ```

3. Run the playbook as normal. The vault is decrypted automatically:

    ```bash
    ansible-playbook -i inventories/<your_inventory>/inventory nas.yml -K
    ```

    If you'd rather not keep a password file, skip the `export` and add `--ask-vault-pass` instead.

## Everyday Commands

| Task | Command |
| --- | --- |
| Edit secrets | `ansible-vault edit <path>/vault.yml` |
| View secrets | `ansible-vault view <path>/vault.yml` |
| Change the vault password | `ansible-vault rekey <path>/vault.yml` |
| Check a value decrypts | `ansible -i <inventory> all -m debug -a "var=nextcloud_sql_password"` |

To see decrypted changes in `git diff`, run this once per clone:

```bash
git config diff.ansible-vault.textconv "ansible-vault view"
```

## Gotchas

- **Database passwords are only read once.** MariaDB and Postgres containers use their password variables when the database is first created. Changing the value later doesn't change the database. For an app that's already running, put its current password in the vault, or change it inside the database first.
- **Encrypting doesn't clean history.** If secrets were committed in plain text before, rotate them.
- **Dictionaries are replaced, not merged.** Setting `traefik_environment_variables` replaces the role default entirely, so include every key you need.
- **Never commit the password file.** `.gitignore` excludes common names, and the pre-commit hook `vault-encrypted` refuses to commit an unencrypted `vault.yml`.
