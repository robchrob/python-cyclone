.PHONY: install test run dev rerun docker_rel docker_dev

default: rerun

install:
	pip install -e .[dev]

test: install
	pytest --black --cov  .

run:
	python -m cyclone --verbose

dev_build:
	docker build . --tag cyclone:latest

prod_build:
	docker build . -f Dockerfile-dev --tag cyclone-dev:latest

rerun: install run
dev: install test run
