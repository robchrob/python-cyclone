.PHONY: install coverage test run dev

default: test

test:
	pytest -vv --cov-report term-missing --cov=app .

run:
	pip install -e .[all]
	python -m app --fib 150 --collatz 23984928359923 --debug

dev: test run
