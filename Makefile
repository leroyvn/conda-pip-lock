update-deps:  # Update dependencies
	python requirements/make_conda_env.py -o requirements/environment.yml --quiet
	conda env update --file requirements/environment.yml
	conda-lock --file requirements/environment.yml --filename-template "requirements/environment-{platform}.lock"

init:  # Initialise development environment
	conda create --name test --file requirements/environment-osx-64.lock
	pip install --editable .

update: update-deps init

.PHONY: update-deps init update test
