## Why

GitHub Actions already contains plenty of [context](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions) for use within Actions workflows.

However, it's very limited, and does not include the entirety of the repository metadata, for example: [API Previews metadata](https://docs.github.com/en/rest/overview/api-previews)

## Usage

```yaml
jobs:
  job:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - id: metadata
        uses: ahmadnassri/action-metadata@v1

      # checks if this repository is a template repository and prints the template repository name
      - if: ${{ !fromJSON(steps.metadata.outputs.repository).is_template }}
        run: echo ${{ fromJSON(steps.metadata.outputs.repository).template_repository.name }}
```
