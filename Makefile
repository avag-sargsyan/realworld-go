PLUGIN_DIR := $(HOME)/.golangci-lint-plugins
RESTRICTIMPORTS_NAME := restrictimports
GOMODCHECK_NAME := gomodcheck
COPY_TO := lint-plugins
GOLANGCI_LINT_VERSION := v1.55.2 # Should match the version in go.mod file

# Loads the plugin from the ~/.golangci-lint-plugins directory into the project to specify it in the .golangci.yml file
.PHONY: load-plugin
load-plugin:
	@mkdir -p $(COPY_TO)
	@cp $(PLUGIN_DIR)/$(RESTRICTIMPORTS_NAME).so $(COPY_TO)/
	@cp $(PLUGIN_DIR)/$(GOMODCHECK_NAME).so $(COPY_TO)/

install-golangci-lint:
	@echo "Installing golangci-lint $(GOLANGCI_LINT_VERSION)"
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@$(GOLANGCI_LINT_VERSION)