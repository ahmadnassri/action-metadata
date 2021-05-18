#!/bin/bash
set -euo pipefail

declare -A ENDPOINTS

ENDPOINTS[repository]="repos/:owner/:repo"

HEADERS=(
  "application/vnd.github.v3.raw+json"
  "application/vnd.github.wyandotte-preview+json"
  "application/vnd.github.ant-man-preview+json"
  "application/vnd.github.squirrel-girl-preview+json"
  "application/vnd.github.mockingbird-preview+json"
  "application/vnd.github.inertia-preview+json"
  "application/vnd.github.cloak-preview+json"
  "application/vnd.github.mercy-preview+json"
  "application/vnd.github.scarlet-witch-preview+json"
  "application/vnd.github.zzzax-preview+json"
  "application/vnd.github.luke-cage-preview+json"
  "application/vnd.github.starfox-preview+json"
  "application/vnd.github.fury-preview+json"
  "application/vnd.github.flash-preview+json"
  "application/vnd.github.surtur-preview+json"
  "application/vnd.github.corsair-preview+json"
  "application/vnd.github.switcheroo-preview+json"
  "application/vnd.github.groot-preview+json"
  "application/vnd.github.dorian-preview+json"
  "application/vnd.github.lydian-preview+json"
  "application/vnd.github.london-preview+json"
  "application/vnd.github.baptiste-preview+json"
  "application/vnd.github.nebula-preview+json"
)

ARGS=$(printf -- "-H 'Accept: %s' " "${HEADERS[@]}")

for NAME in "${!ENDPOINTS[@]}"; do
  echo ::set-output name=$NAME::"$(eval gh api "${ENDPOINTS[$NAME]}" "$ARGS")"
done
