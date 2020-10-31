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

linker = lld
mandir = /usr/local/man

clang = clang src/ansi-colors.c -fuse-ld=$(linker) -o

local:
> mkdir build || true
> $(clang) build/ansi-colors
.PHONY: local

clean:
> rm -rf build man
.PHONY: clean

install:
> $(clang) /usr/local/bin/ansi-colors
> sphinx-build -b man doc man
> gzip man/ansi-colors.1 > /usr/local/man/man1/ansi-colors.1.gz
.PHONY: install

uninstall:
> rm -f /usr/local/bin/ansi-colors /usr/local/man/man1/ansi-colors.1.gz
.PHONY: uninstall
