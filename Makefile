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

clang = clang src/ansi-colors.c -fuse-ld=$(linker) -o

local:
> echo $(linker)
> mkdir build || true
> $(clang) build/ansi-colors

clean:
> rm -rf build

install:
> $(clang) /usr/local/bin/ansi-colors

uninstall:
> rm -f /usr/local/bin/ansi-colors
