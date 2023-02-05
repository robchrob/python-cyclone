.PHONY: test run dev

default: build

build:
	pip install --upgrade pip
	pip install -r ./requirements.txt
	pip install -e .[all]

test: build
	pip install pytest pytest-cov pytest-black pytest-instafail
	pytest -v --cov-report=html --cov=app .

run:
	python -m app --fib 150 --collatz 23984928359923 --debug

dev: test run
