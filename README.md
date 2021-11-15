# Pre-commit-hooks

This repo defines pre-commit hooks for use with the [pre-commit](https://pre-commit.com/index.html#intro) utility.

## Installation

For installation on Macs, run:

```shell
brew install pre-commit
```

For other systems, refer to the [pre-commit](https://pre-commit.com/index.html#install) docs for installation instructions.

## Usage

Create a `.pre-commit-config.yaml` file at the root of a repo, then reference this hook repo,
the revision of the hook repo you want to use, and any hooks you want to use.

An example:

```yaml
repos:
  - repo: git://github.com/kenpetti-toasttab/pre-commit-hooks
    rev: <some tag>
    hooks:
      - id: shellcheck
      - id: go-fmt
      - id: go-lint
```

## Running hooks

When working in a repo that has a `.pre-commit-config.yaml`, a user can install the hooks by running:

```bash
pre-commit install
```

They will run automatically when commiting files to the repo. If none of the files changed match a hook (ex. no Go files were modified) those checks will be skipped.

All hooks can be run on a repo by running:

```bash
pre-commit run --all-files
```

That will run the hooks on all files in the repo, regardless if they were modified in the last commit.

### CI usage

Pre-commit can be used in CI pipelines by running:

```bash
pre-commit install
pre-commit run --all-files
```

## Available Hooks

| Name            | Description                                                                                              | Language |
| --------------- | -------------------------------------------------------------------------------------------------------- | -------- |
| `go-fmt`        | Runs `gofmt`, requires golang                                                                            | golang   |
| `go-imports`    | Runs `goimports`, requires golang                                                                        | golang   |
| `go-vet`        | Runs `go vet`, requires golang                                                                           | golang   |
| `go-lint`       | Runs `golint`, requires https://github.com/golang/lint                                                   | golang   |
| `go-cyclo`      | Runs `gocyclo`, requires <https://github.com/fzipp/gocyclo>                                              | golang   |
| `no-go-testing` | Checks that no files are using `testing.T`, if you want developers to use a different testing framework" | golang   |
| `golangci-lint` | Runs `golangci-lint`, requires <https://github.com/golangci/golangci-lint>                               | golang   |
| `go-critic`     | Runs `go-critic`, requires <https://github.com/go-critic/go-critic>                                      | golang   |
| `go-unit-tests` | Runs `go test`                                                                                           | golang   |
| `go-build`      | Runs `go build`, requires golang                                                                         | golang   |
| `go-generate`   | Runs `go generate`, requires golang                                                                      | golang   |
| `go-mod-tidy`   | Runs `go mod tidy -v`, requires golang                                                                   | golang   |
| `go-mod-vendor` | Runs `go mod vendor`, requires golang                                                                    | golang   |
| `shellcheck`    | Performs linting on bash scripts, requires shellcheck                                                    | shell    |
| `markdownlint`  | Check markdown files and flag style issues, auto-fixing if possible                                      | markdown |
