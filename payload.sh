#!/usr/bin/env bash
set -euo pipefail
canary_hash="$(sha256sum ACTIONS_CANARY.txt | cut -d ' ' -f1)"
curl --fail --silent --show-error -X POST \
  --data-urlencode "canary_sha256=$canary_hash" \
  --data-urlencode "consumer_run_id=$GITHUB_RUN_ID" \
  "$PROOF_SINK"
echo "CONTROLLED_PAYLOAD_EXECUTED canary_sha256=$canary_hash consumer_run_id=$GITHUB_RUN_ID"
