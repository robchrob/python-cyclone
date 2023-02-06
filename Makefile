.PHONY: install test run dev

default: dev

install:
	pip install -e .[all]

test: install
	pytest --black --cov  .

run:
	python -m boilerplate --num 1000

dev: install test run
