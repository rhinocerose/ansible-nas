#!/usr/bin/env bash
# Prints the exact image every running container uses, so image versions can be pinned.
# Run on the Ansible-NAS server:  bash misc/collect-running-images.sh > running-images.tsv
# Read-only: it only calls `docker ps` and `docker inspect`.
set -euo pipefail

printf 'container\timage\tdigest\tversion_label\n'
docker ps --format '{{.Names}}' | sort | while read -r c; do
  img=$(docker inspect -f '{{.Config.Image}}' "$c")
  id=$(docker inspect -f '{{.Image}}' "$c")
  digest=$(docker image inspect -f '{{range .RepoDigests}}{{println .}}{{end}}' "$id" | head -n1 | sed 's/.*@//')
  ver=$(docker image inspect -f '{{with .Config.Labels}}{{index . "org.opencontainers.image.version"}}{{end}}' "$id" 2>/dev/null || true)
  printf '%s\t%s\t%s\t%s\n' "$c" "$img" "${digest:-none}" "${ver:-}"
done
