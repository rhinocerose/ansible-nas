---
title: "Stats"
---

The stats role uses Prometheus, Grafana, Telegraf and a number of metrics exporters to collect and record lots of metrics about your NAS.

Telegraf also exposes an InfluxDB endpoint for applications that require it.

## Usage

Set `stats_enabled: true` in your `inventories/<your_inventory>/nas.yml` file. If you want to gather metrics on your internet connection, enable `stats_internet_speed_test_enabled` too.

If you want to access Grafana externally, set `stats_grafana_available_externally: true` in your `inventories/<your_inventory>/nas.yml` file. If you want to access Prometheus externally, set `stats_prometheus_available_externally: true` in your `inventories/<your_inventory>/nas.yml` file.

The Grafana web interface can be found at <http://ansible_nas_host_or_ip:3000>, Prometheus can be found at <http://ansible_nas_host_or_ip:9090>.

## Dashboards

Two dashboards are provisioned automatically:

- **Ansible-NAS Overview v2** covers CPU, memory, swap, filesystem, Docker, temperature, ZFS I/O, physical disk I/O, SMART age counters and internet speed.
- **Ansible-NAS — Health & Capacity** focuses on capacity forecasts, inodes, disk latency, SMART health attributes, ZFS pool/ARC metrics, Docker OOM/restart signals, network errors, incoming Traefik connections and request rates, scrape health and Traefik latency.

Dashboard definitions live in `roles/stats/files/dashboards` and are provisioned read-only. Edit the JSON files in the repository rather than the Grafana UI.
