SCRIPTS_DIR := ./scripts

.PHONY: cl_all restrictimports gomodcheck

cl_all: restrictimports gomodcheck

restrictimports:
	@bash $(SCRIPTS_DIR)/restrictimports.sh

gomodcheck:
	@bash $(SCRIPTS_DIR)/gomodcheck.sh