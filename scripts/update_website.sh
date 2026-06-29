#!/usr/bin/env bash

set -exu

if [ -z "${CLOUDFLARE_WEBHOOK:-}" ]; then
  echo "No CLOUDFLARE_WEBHOOK provided, skipping website update."
  exit 0
fi

curl -d "" "$CLOUDFLARE_WEBHOOK"
