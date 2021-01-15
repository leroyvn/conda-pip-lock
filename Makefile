update-deps:
	python requirements/make_conda_env.py -o requirements/conda/environment.yml --quiet
	conda env update --file requirements/conda/environment.yml
	conda-lock --file requirements/conda/environment.yml --filename-template "requirements/conda/environment-{platform}.lock"

init:
	conda create --name test --file requirements/conda/environment-osx-64.lock

update: update-deps init

.PHONY: update-deps init update
