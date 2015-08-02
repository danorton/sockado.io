
PY_ALL := $(wildcard *.py tests/*.py)

.PHONY: all test lint

all: test
local: travis-lint-made all

lint: flake8-made $(PY_ALL)
flake8-made:
	flake8 .
	touch $@

lint-local: lint travis-lint-made
travis-lint-made: .travis.yml
	travis-lint $<
	touch $@

test: test-made
test-made: flake8-made $(PY_ALL)
	py.test
	touch $@

clean:
	find . \( -name '*.pyc' -o -name '__pycache__' \) -print -delete
	rm -f *-made
