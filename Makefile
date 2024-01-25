DOCKER_NAME=python-kata-setup

help: ## Show this help message.
	@echo 'USAGE: make [target]'
	@echo
	@echo 'TARGETS:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

build: ## Build the docker container.
	@docker build . -t ${DOCKER_NAME}

version: ## Display the Python version.
	@docker run --rm -v "${PWD}:/code" ${DOCKER_NAME} make dc-version

test: ## Run the tests.
	@docker run --rm -v "${PWD}:/code" ${DOCKER_NAME} make dc-test

coverage: ## Generates a code coverage report.
	@docker run --rm -v "${PWD}:/code" ${DOCKER_NAME} make dc-coverage
	@$(open_command) htmlcov/index.html


dc-version:
	python --version

dc-test:
	python -m unittest tests/*_test.py

dc-coverage:
	pytest --cov=src tests/*_test.py
	coverage html


OS := $(shell uname)
ifeq ($(OS), Linux)
	open_command=xdg-open
else ifeq ($(OS), Darwin)
	open_command=open
else
	open_command=echo
endif
