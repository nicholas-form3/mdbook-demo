default: install

all: hooks install build


h help:
	@grep '^[a-z]' Makefile


.PHONY: hooks
hooks:
	cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push

install:
	cargo install mdbook
	cargo install mdbook-plantuml --no-default-features
	cargo install mdbook-mermaid
	mdbook-mermaid install

s serve:
	mdbook serve


build:
	mdbook build