# Actions Metadata

All repo and event metadata for use in Actions workflows

[![license][license-img]][license-url]
[![test][test-img]][test-url]
[![semantic][semantic-img]][semantic-url]

## Why

GitHub Actions already contains plenty of [context][] for use within Actions workflows.

However, it's very limited, and does not include the entirety of the repository metadata, for example: [API Previews metadata][]

## Usage

``` yaml
jobs:
  job:
    runs-on: ubuntu-latest

    steps:
      - id: metadata
        uses: ahmadnassri/action-metadata@v1

      # checks if this repository is a template repository and prints the template repository name
      - if: ${{ !fromJSON(steps.metadata.outputs.repository).is_template }}
        run: echo ${{ fromJSON(steps.metadata.outputs.repository).template_repository.name }}
```

  [context]: https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions
  [API Previews metadata]: https://docs.github.com/en/rest/overview/api-previews

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
