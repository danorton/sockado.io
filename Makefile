
PY_ALL := $(shell find . -name '*.py') bin/run_server

.PHONY: all local lint-local test lint install uninstall

all: lint-local
local: lint-local
lint-local: travis-lint-made lint

lint: flake8-made
flake8-made: $(PY_ALL)
	flake8 --config=./flake8.ini $(PY_ALL)
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
install-made: lint Makefile setup.py requirements.txt
	pip install .
	pip install -r requirements.txt
	touch $@

uninstall: lint
	rm -f install-made
	-pip uninstall -y sockado_io

reinstall: uninstall
	pip install .

clean:
	find . \( -name '*.pyc' -o -name '__pycache__' \) -print -delete
	rm -f *-made
