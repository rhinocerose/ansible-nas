---
title: "NetBird"
---

Homepage: <https://netbird.io/>

NetBird is a self-hosted, WireGuard-based VPN and zero-trust network access platform. It connects machines, containers and networks through an overlay network without opening ports on each peer.

## Usage

Set `netbird_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The NetBird dashboard can be found at <http://ansible_nas_host_or_ip:8085>.

## Specific Configuration

NetBird requires clients to reach the management server at a URL that is resolvable from every peer. To use the dashboard and management API on the same origin, set `netbird_available_externally: true`, create a DNS record for `netbird.<your-domain>` and forward ports `80` and `443` to Ansible-NAS. Traefik then serves the dashboard, API, WebSocket and gRPC endpoints on that hostname.

Port `3478/udp` is used for STUN and must be reachable by peers. The management server listens on `8086` and the dashboard on `8085` for local access, but these ports are not a substitute for a properly published URL when remote peers are involved.

Before exposing NetBird to the internet, change `netbird_relay_auth_secret`, `netbird_datastore_encryption_key` and `netbird_session_cookie_encryption_key`. The encryption keys must remain unchanged after the data directory has been initialised.

After the containers have started, open the dashboard URL and complete the setup page to create the first administrator account.
