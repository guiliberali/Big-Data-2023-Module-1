VIRTUALENV?=venv
PORT?=8888
SHELL=/bin/bash

help:
	@echo "Make targets:"
	@echo " install       create virtual environment (venv) and install required packages"
	@echo " freeze      persist installed packages to requirements.txt"
	@echo " clean       remove *.pyc files and __pycache__ directory"
	@echo " venvclean   remove virtual environment (venv)"
	@echo " run         run jupyter lab (default port $(PORT))"
	@echo "Check the Makefile for more details"

install:
	python3 -m venv $(VIRTUALENV)
	. $(VIRTUALENV)/bin/activate; pip install --upgrade pip; pip install -r requirements.txt

clean:
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -type d -exec rm -rf {} \+
	find . -name ".ipynb_checkpoints" -type d -exec rm -rf {} \+

venvclean: clean
	rm -rf $(VIRTUALENV)

run:
	. $(VIRTUALENV)/bin/activate; jupyter lab --no-browser --port=$(PORT)
