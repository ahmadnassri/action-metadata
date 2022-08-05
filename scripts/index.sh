#!/bin/bash
set -euo pipefail

declare -A ENDPOINTS
declare -A PROPS_PREFIX

# endpoints we want to call
ENDPOINTS[repository]="repos/:owner/:repo"

PROPS_PREFIX[REPO]="repository"
PROPS_PREFIX[ORG]="organization"
PROPS_PREFIX[OWNER]="owner"
PROPS_PREFIX[LICENSE]="license"
PROPS_PREFIX[TEMPLATE_REPO]="template_repository"

# props we want to export
REPO_PROPS=(
  "id"
  "name"
  "full_name"
  "private"
  "html_url"
  "description"
  "fork"
  "git_url"
  "ssh_url"
  "clone_url"
  "svn_url"
  "homepage"
  "language"
  "forks_count"
  "stargazers_count"
  "watchers_count"
  "size"
  "default_branch"
  "open_issues_count"
  "is_template"
  "has_issues"
  "has_projects"
  "has_wiki"
  "has_pages"
  "has_downloads"
  "archived"
  "disabled"
  "visibility"
  "pushed_at"
  "created_at"
  "updated_at"
  "allow_rebase_merge"
  "allow_squash_merge"
  "allow_auto_merge"
  "delete_branch_on_merge"
  "allow_merge_commit"
  "subscribers_count"
  "network_count"
)

OWNER_PROPS=(
  "id"
  "login"
  "avatar_url"
  "html_url"
  "type"
)

LICENSE_PROPS=(
  "key"
  "name"
  "spdx_id"
)

TEMPLATE_REPO_PROPS=(
  "id"
  "name"
  "full_name"
  "html_url"
)

for NAME in "${!ENDPOINTS[@]}"; do
  echo ::debug::fetch ${NAME}
  JSON=$(eval gh api "${ENDPOINTS[$NAME]}" "-H 'Accept: application/vnd.github+json'")
  echo ::set-output name=${NAME}_json::"${JSON}"
done

for PREFIX in "${!PROPS_PREFIX[@]}"; do
  # echo $PREFIX
  # populate props
  VARNAME="${PREFIX}_PROPS"
  KEY="${PROPS_PREFIX[$PREFIX]}"
  declare -n PROPS_ARRAY=${VARNAME}
  for PROP in "${PROPS_ARRAY[@]}"; do
     [[ $KEY = "repository" ]] && JQ_KEY="" || JQ_KEY=".${KEY}"
    echo ::set-output name=${KEY}_${PROP}::"$(echo $JSON | jq -r ${JQ_KEY}.${PROP})"
  done
done
