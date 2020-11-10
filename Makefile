SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
        $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

CC = gcc
CFLAGS =

local:
> mkdir build || true
> $(CC) $(CFLAGS) src/ansi-colors.c -o build/ansi-colors
.PHONY: local

clean:
> rm -rf build man
.PHONY: clean

install:
> mkdir -p /usr/local/{bin,man/man1} || true
> $(CC) $(CFLAGS) src/ansi-colors.c -o /usr/local/bin/ansi-colors
> sphinx-build -b man doc man
> gzip -c man/ansi-colors.1 > /usr/local/man/man1/ansi-colors.1.gz
.PHONY: install

uninstall:
> rm -f /usr/local/bin/ansi-colors /usr/local/man/man1/ansi-colors.1.gz
.PHONY: uninstall
