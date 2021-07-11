.PHONY: install coverage test run dev

default: test

install:
	pipenv install --dev
	pipenv run pip install -r requirements-linter.txt
	pipenv run pip install -r requirements-tools.txt

test:
	pytest -vv --html=.report.html --self-contained-html --black --flake8 --cov-report term-missing --cov=app .

run:
	pip install -e .[all]
	python -m app --fib 150 --collatz 23984928359923 --debug

dev: test run
