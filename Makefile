.PHONY: install test run dev docker_rel docker_dev

default: dev

install:
	pip install -e .[all]

test: install
	pytest --black --cov  .

run:
	python -m boilerplate --num 1000

docker_rel:
	docker build . --tag boilerplate:latest

docker_dev:
	docker build . -f Dockerfile-dev --tag boilerplate_dev:latest

dev: install test run
