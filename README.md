# This repository is used to test custom linters for golangci-lint

## How to use
- Already build plugins are available in the `lint-plugins` directory.
- Linters' Configuration can be found in the `.golangci.yml` file.
- In order to run the linters, you need to run the following command:
```bash
golangci-lint run ./...
```
- In order to clear cache:
```bash
golangci-lint cache clean
```

More information about golangci-lint can be found in the [official documentation](https://golangci-lint.run/usage/install/#local-installation).

In order to liner plugins run smoothly, need to be installed a specific version of golangci-lint, the same for which plugins are built.
In order to install a specific version of golangci-lint, you can use the following command:
```bash
make install-golangci-lint
```

Linter plugins can be loaded to the `lint-plugins` directory from `~/.golangci-lint-plugins` by running the following command:
```bash
make load-plugins
```

For more how to build/configure plugins please refer to [golangci-lint plugins documentation](https://github.com/YAtechnologies/lmd-pkg-yassir)
TODO: provide link to the plugins documentations.

Original repository: https://github.com/AngusGMorrison/realworld-go