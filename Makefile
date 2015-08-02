

.PHONY: all test lint

all: test

lint: flake8-made
flake8-made:
	flake8 .
	touch flake8-made

test: lint
	py.test

clean:
	find . \( -name '*.pyc' -o -name '__pycache__' \) -print -delete
	rm -f *-made
