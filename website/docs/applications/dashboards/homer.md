---
title: "Homer"
---

Homepage: <https://github.com/bastienwirtz/homer>

Homer is a simple, static homepage for your server. It is configured with a single YAML file and supports grouped links, icons, themes and optional service health checks.

## Usage

Set `homer_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The Homer web interface can be found at <http://ansible_nas_host_or_ip:8087>.

## Specific Configuration

Homer's configuration lives in `{{ docker_home }}/homer/assets/config.yml`. A default configuration is created the first time the container starts; edit that file and restart the container to apply your changes.

Homer does not provide authentication, so only enable external access if you are comfortable with the dashboard being reachable from the internet.
