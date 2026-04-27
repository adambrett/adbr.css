export

SHELL := /bin/bash -o errexit -o nounset -o pipefail

MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

VERBOSE ?= false
ifeq (${VERBOSE}, false)
	# --silent drops the need to prepend @
	MAKEFLAGS += --silent
endif

# Variables
SRC := adbr.css
MIN := adbr.min.css

# Tools
NPM := npm

# Helpers
.PHONY: all
all: depend build preview

.PHONY: run
run: build preview ## Build then open the site

.PHONY: preview
preview: ## Serve the repo root (see package.json)
	${NPM} run preview

# Dependencies
.PHONY: depend
depend: ## Install build deps
	${NPM} install

# Linting
.PHONY: lint
lint: ## Lint CSS
	${NPM} run lint

# Building
.PHONY: build
build: ## Build adbr.min.css
	${NPM} run build

# Make
.PHONY: help
help:
	awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*?##/ { printf "\033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
