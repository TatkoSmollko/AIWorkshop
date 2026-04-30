#!/bin/bash

set -e

if [ -f "$(dirname "$0")/.env" ]; then
  export $(grep -v '^#' "$(dirname "$0")/.env" | xargs)
fi

REPO="TatkoSmollko/AIWorkshop"

usage() {
  echo "Usage: $0 -t <ticket-title>"
  echo "  -t    ticket title to search for (e.g. PVCSX-100)"
  exit 1
}

while getopts "t:" opt; do
  case $opt in
    t) TICKET="$OPTARG" ;;
    *) usage ;;
  esac
done

[ -z "$TICKET" ] && usage

GITHUB_TOKEN="$GITHUB_TOKEN" gh issue list \
  --repo "$REPO" \
  --search "$TICKET" \
  --limit 10 \
  --json number,title,state,body,labels,assignees,createdAt,url \
  | jq --arg t "$TICKET" '.[] | select(.title == $t)'
