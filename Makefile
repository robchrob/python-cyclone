.PHONY: test run dev

default: build

build:
	pip install -r ./requirements.txt
	pip install -e .[dev]

test: build
	pip install -r ./requirements.txt
	pytest --black  .

run:
	python -m app --fib 150 --collatz 23984928359923 --debug

dev: test run
