.PHONY: mypy
mypy:
	mypy -p sgen -p test
	mypy bin/*.py

.PHONY: mypy
test: mypy
	flake8 sgen test
	pytest test
