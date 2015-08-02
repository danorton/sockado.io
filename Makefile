
PY_ALL := $(wildcard *.py tests/*.py)

.PHONY: all local lint-local test lint install

all: local
local: lint-local install
lint-local: travis-lint-made lint

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

install: install-made
install-made: Makefile setup.py requirements.txt
	pip install .
	pip install -r requirements.txt
	touch $@

clean:
	find . \( -name '*.pyc' -o -name '__pycache__' \) -print -delete
	rm -f *-made
