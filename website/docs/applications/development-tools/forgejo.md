---
title: "Forgejo"
---

Homepage: <https://forgejo.org/>

Forgejo is a self-hosted, lightweight software forge. It is a community-led fork of Gitea and provides Git repositories, issue tracking, pull requests, packages and CI integrations in a single web application.

## Usage

Set `forgejo_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The Forgejo web interface can be found at <http://ansible_nas_host_or_ip:3002>.

## Specific Configuration

Forgejo uses a PostgreSQL container that is created alongside the application. The HTTP port defaults to `3002` and the SSH port to `2222`, both of which can be overridden with `forgejo_port_http` and `forgejo_port_ssh`.

The first visit to the web interface shows the Forgejo installation page. The database settings are already supplied through environment variables, so only the administrator account and the remaining site settings need to be configured.
