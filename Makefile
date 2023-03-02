.PHONY: install test run dev rerun docker_rel docker_dev

default: rerun

install:
	pip install -e .[dev]

test: install
	pytest --black --cov  .

run:
	python -m cyclone --verbose --num 1337

docker_rel:
	docker build . --tag cyclone:latest

docker_dev:
	docker build . -f Dockerfile-dev --tag cyclone-dev:latest

rerun: install run
dev: install test run
