
PY_ALL := $(wildcard *.py tests/*.py)

.PHONY: all local local-lint test lint

all: local
local: local-lint
local-lint: travis-lint-made lint

lint: flake8-made
flake8-made: $(PY_ALL)
	flake8 $(PY_ALL)
	touch $@

lint-local: lint travis-lint-made
travis-lint-made: .travis.yml
	travis-lint $<
	touch $@

test: test-made
test-made: flake8-made $(PY_ALL) Makefile
	py.test
	touch $@

clean:
	find . \( -name '*.pyc' -o -name '__pycache__' \) -print -delete
	rm -f *-made
