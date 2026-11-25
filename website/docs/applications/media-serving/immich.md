---
title: "Immich"
---

Homepage: <https://immich.app/>

Immich is a self-hosted photo and video backup solution with mobile apps, automatic uploads, facial recognition, object detection and a timeline-based web interface.

## Usage

Set `immich_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The Immich web interface can be found at <http://ansible_nas_host_or_ip:2283>.

## Specific Configuration

Immich stores uploaded photos and videos in `{{ photos_root }}/immich` by default. Override `immich_upload_directory` to use a different location, and make sure it has enough free space for your library.

The PostgreSQL database and the machine learning model cache are stored under `{{ docker_home }}/immich`. The role creates and connects the Immich server, machine learning, PostgreSQL and Redis containers automatically.

The first account created in the web interface becomes the administrator. Mobile apps connect to the same URL and use the server's address as the endpoint.
