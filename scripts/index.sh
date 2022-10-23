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
# shellcheck disable=SC2034
REPO_PROPS=(
  "id"
  "name"
  "full_name"
  "private"
  "html_url"
  "description"
  "fork"
  "created_at"
  "updated_at"
  "pushed_at"
  "git_url"
  "ssh_url"
  "clone_url"
  "svn_url"
  "homepage"
  "size"
  "stargazers_count"
  "watchers_count"
  "language"
  "has_issues"
  "has_projects"
  "has_downloads"
  "has_wiki"
  "has_pages"
  "forks_count"
  "archived"
  "disabled"
  "open_issues_count"
  "allow_forking"
  "is_template"
  "web_commit_signoff_required"
  "visibility"
  "default_branch"
  "allow_squash_merge"
  "allow_merge_commit"
  "allow_rebase_merge"
  "allow_auto_merge"
  "delete_branch_on_merge"
  "allow_update_branch"
  "use_squash_pr_title_as_default"
  "network_count"
  "subscribers_count"
)

# shellcheck disable=SC2034
OWNER_PROPS=(
  "id"
  "login"
  "avatar_url"
  "html_url"
  "type"
)

# shellcheck disable=SC2034
LICENSE_PROPS=(
  "key"
  "name"
  "spdx_id"
)

# shellcheck disable=SC2034
TEMPLATE_REPO_PROPS=(
  "id"
  "name"
  "full_name"
  "html_url"
)

for NAME in "${!ENDPOINTS[@]}"; do
  echo ::debug::fetch ${NAME}
  JSON=$(eval gh api "${ENDPOINTS[$NAME]}" "-H 'Accept: application/vnd.github+json'")
  echo ${NAME}_json="${JSON}" >> ${GITHUB_OUTPUT}
done

for PREFIX in "${!PROPS_PREFIX[@]}"; do
  # echo $PREFIX
  # populate props
  VARNAME="${PREFIX}_PROPS"
  KEY="${PROPS_PREFIX[$PREFIX]}"
  declare -n PROPS_ARRAY=${VARNAME}
  for PROP in "${PROPS_ARRAY[@]}"; do
    [[ $KEY = "repository" ]] && JQ_KEY="" || JQ_KEY=".${KEY}"
    echo ${KEY}_${PROP}="$(echo "${JSON}" | jq -r ${JQ_KEY}.${PROP})" >> ${GITHUB_OUTPUT}
  done
done
