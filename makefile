.PHONY: purge init lab ipython

init: purge
	virtualenv -p python3 env
	env/bin/pip install -r requirements.txt

purge:
	-@rm -rf env .pytest_cache tests/__pycache__ __pycache__ _skbuild dist .coverage
	-@find . -type d -name '*.egg-info' | xargs rm -r
	-@find . -type f -name '*.pyc' | xargs rm -r
	-@find . -type d -name '*.ipynb_checkpoints' | xargs rm -r

lab:
	env/bin/jupyter lab

ipython:
	env/bin/ipython
