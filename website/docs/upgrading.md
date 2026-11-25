# Upgrading

Upgrading consists of two steps - firstly updating the Ansible-NAS code on your Ansible control node, and then running the playbook against your Ubuntu server.

Assuming you haven't changed anything except the files in your inventory directory, pull the latest updates from your repository's default branch:

```bash
git pull origin main
```

If you're tracking the original project directly, its default branch is `master`, so use `git pull origin master` instead. To bring upstream changes into your own fork, add it as a remote once and merge from it:

```bash
git remote add upstream https://github.com/davestephens/ansible-nas.git
git fetch upstream
git merge upstream/master
```

If you've changed files outside of the inventory directory, you'll need to fix any merge conflicts.

If you keep secrets in [Ansible Vault](further-configuration/ansible-vault.md), make sure your vault password file is in place before running the playbook.

To see the effect of running the latest version of Ansible-NAS against your Ubuntu server, you can run Ansible in check mode first:

```bash
ansible-playbook -i inventories/<your_inventory>/inventory nas.yml -b -K -C
```

Once you're happy, run as normal.
