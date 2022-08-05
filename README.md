# Actions Metadata

All repo and event metadata for use in Actions workflows

[![license][license-img]][license-url]
[![test][test-img]][test-url]
[![semantic][semantic-img]][semantic-url]

## Why

GitHub Actions already contains plenty of [context][] for use within Actions workflows.

However, it's very limited, and does not include the entirety of the repository metadata.

## Usage

``` yaml
jobs:
  job:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - id: metadata
        uses: ahmadnassri/action-metadata@v2

      # simple usage example
      - run: |
        echo ${{ steps.metadata.outputs.repository_full_name }}
        echo ${{ steps.metadata.outputs.owner_login }}
        echo ${{ steps.metadata.outputs.template_repository_name }}

      # legacy (v1) usage example: use the full JSON object
      - run: |
        echo ${{ fromJSON(steps.metadata.outputs.repository_json).full_name }}
        echo ${{ fromJSON(steps.metadata.outputs.repository_json).owner.login }}
        echo ${{ fromJSON(steps.metadata.outputs.repository_json).template_repository.name }}

      # advanced usage example:
      - run: |
        echo ${{ steps.metadata.outputs.repository_json }}" | jq '.full_name, .owner.login, .template_repository.name'
```

## Outputs

This action will output the following properties:

<!-- markdownlint-capture -->

<!-- markdownlint-disable MD034 -->

| property                                    | example                                                    |
|---------------------------------------------|------------------------------------------------------------|
| `repository_json`                           | { ... } **full** JSON object of the current repository     |
| `repository_id`                             | 368563995                                                  |
| `repository_name`                           | action-metadata                                            |
| `repository_full_name`                      | ahmadnassri/action-metadata                                |
| `repository_private`                        | false                                                      |
| `repository_html_url`                       | <https://github.com/ahmadnassri/action-metadata>           |
| `repository_description`                    | get all the repository metadata for use in Actions         |
| `repository_fork`                           | false                                                      |
| `repository_created_at`                     | 2021-05-18T14:38:41Z                                       |
| `repository_updated_at`                     | 2021-11-13T06:48:56Z                                       |
| `repository_pushed_at`                      | 2022-08-03T14:36:17Z                                       |
| `repository_git_url`                        | git://github.com/ahmadnassri/action-metadata.git           |
| `repository_ssh_url`                        | <git@github.com>:ahmadnassri/action-metadata.git           |
| `repository_clone_url`                      | <https://github.com/ahmadnassri/action-metadata.git>       |
| `repository_svn_url`                        | <https://github.com/ahmadnassri/action-metadata>           |
| `repository_homepage`                       | <https://ahmadnassri.com/projects/>                        |
| `repository_size`                           | 24                                                         |
| `repository_stargazers_count`               | 1                                                          |
| `repository_watchers_count`                 | 1                                                          |
| `repository_language`                       | Shell                                                      |
| `repository_has_issues`                     | true                                                       |
| `repository_has_projects`                   | false                                                      |
| `repository_has_downloads`                  | false                                                      |
| `repository_has_wiki`                       | false                                                      |
| `repository_has_pages`                      | false                                                      |
| `repository_forks_count`                    | 0                                                          |
| `repository_archived`                       | false                                                      |
| `repository_disabled`                       | false                                                      |
| `repository_open_issues_count`              | 5                                                          |
| `repository_allow_forking`                  | true                                                       |
| `repository_is_template`                    | false                                                      |
| `repository_web_commit_signoff_required`    | false                                                      |
| `repository_visibility`                     | public                                                     |
| `repository_default_branch`                 | master                                                     |
| `repository_allow_squash_merge`             | true                                                       |
| `repository_allow_merge_commit`             | false                                                      |
| `repository_allow_rebase_merge`             | true                                                       |
| `repository_allow_auto_merge`               | true                                                       |
| `repository_delete_branch_on_merge`         | true                                                       |
| `repository_allow_update_branch`            | true                                                       |
| `repository_use_squash_pr_title_as_default` | false                                                      |
| `repository_network_count`                  | 0                                                          |
| `repository_subscribers_count`              | 1                                                          |
| `license_key`                               | mit                                                        |
| `license_name`                              | MIT License                                                |
| `license_spdx_id`                           | MIT                                                        |
| `owner_id`                                  | 183195                                                     |
| `owner_login`                               | ahmadnassri                                                |
| `owner_avatar_url`                          | <https://avatars.githubusercontent.com/u/183195?v=4>       |
| `owner_html_url`                            | <https://github.com/ahmadnassri>                           |
| `owner_type`                                | User                                                       |
| `template_repository_id`                    | 342988151                                                  |
| `template_repository_name`                  | template-action-composite                                  |
| `template_repository_full_name`             | ahmadnassri/template-action-composite                      |
| `template_repository_html_url`              | <https://github.com/ahmadnassri/template-action-composite> |

<!-- markdownlint-restore -->

  [context]: https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions

----
> Author: [Ahmad Nassri](https://www.ahmadnassri.com/) &bull;
> Twitter: [@AhmadNassri](https://twitter.com/AhmadNassri)

[license-url]: LICENSE
[license-img]: https://badgen.net/github/license/ahmadnassri/action-metadata

[release-url]: https://github.com/ahmadnassri/action-metadata/releases
[release-img]: https://badgen.net/github/release/ahmadnassri/action-metadata

[test-url]: https://github.com/ahmadnassri/action-metadata/actions?query=workflow%3Apush
[test-img]: https://github.com/ahmadnassri/action-metadata/workflows/push/badge.svg

[semantic-url]: https://github.com/ahmadnassri/action-metadata/actions?query=workflow%3Arelease
[semantic-img]: https://badgen.net/badge/📦/semantically%20released/blue
