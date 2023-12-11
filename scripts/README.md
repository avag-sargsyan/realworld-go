# Scripts Documentation

This directory contains scripts for running custom linters.

## gomodcheck.sh

### Overview
`gomodcheck` is a custom linter that verifies dependencies in a Go project's go.mod file against a whitelist of allowed dependencies. This plugin is designed to enforce dependency management policies, ensuring that only approved packages are used in your projects.

### Features
- Verifies that all dependencies in a project's go.mod file are on the whitelist
- Customizable whitelist of allowed dependencies for each project through a `config/gomodcheck-config.yml` configuration file

### Prerequisites
`yq` is required to run this script. Please refer to [yq documentation](https://github.com/mikefarah/yq#install) for installation instructions.

### Usage
Run `make gomodcheck` from the project root or run the both liter script by running `make cl_all`.

### Configuration
Configurations are located in `./config/gomodcheck-config.yml`.
Specify allowed dependencies in the configuration under the `allowed-dep` key:
```yaml
allowed-dep:
  - github.com/stretchr/testify
  - golang.org/x/net
  ...
```

## restrictimports.sh

### Overview
`restrictimports` is a custom linter designed to enforce import restrictions within Go modules. It verifies that modules communicate only via designated aggregator module and the aggregator only imports the allowed packages of the modules.

### Features
- Verifies that modules communicate only via designated aggregator module and don't import each other directly
- Verifies that aggregator only imports the allowed packages of the modules and doesn't import any other packages
- Customizable configuration for each project through a `config/restrictimports-config.yml` configuration file

### Prerequisites
`yq` is required to run this script. Please refer to [yq documentation](https://github.com/mikefarah/yq#install) for installation instructions.

### Usage
Run `make restrictimports` from the project root or run the both liter script by running `make cl_all`.

### Configuration
Configurations are located in `config/restrictimports-config.yml`. Configure the following keys:
```yaml
prefix: github.com/YAtechnologies/lmd-ordering-yassir
root_dir: internal
modules:
  - aggregators
  - delivery
  - orders
aggregator: aggregators
allowed_packages:
  - handlers
```

Where:
- `prefix` - project name defined in `go.mod` file
- `agg-module` - specify the aggregator module name.
- `root_dir` - the directory name where modules are located (for example if modules are located in `internal` directory, then it will be `internal`). If modules are located in the project root, then leave it empty.
- `modules-to-check` - list of modules to check (aggregator also is a module, need to be added here). You can provide an empty array ([]) to ignore modules check.
- `allowed-pkg` - list of allowed packages from modules whitelisted in the `modules-to-check` that can be imported within the aggregator module. Importing other packages of modules not whitelisted here will be reported as violation (subdirectories from modules directory, for example if `order` module has subdirectories `order/handlers` and `order/usecases`, then it will be `handlers`, `usecases`, etc.). You can provide an empty array ([]) to ignore allowed packages check.
