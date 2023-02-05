.PHONY: install test run dev

default: dev

install:
	pip install -r ./requirements.txt
	pip install -e .[dev]

test: install
	pytest --black  .

run:
	python -m app --fib 150 --collatz 23984928359923 --debug

dev: install test run
