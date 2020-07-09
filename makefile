.PHONY: mypy
mypy:
	mypy -p sgen -p test
	mypy bin/*.py

.PHONY: mypy
test: mypy
	flake8 sgen test
	pytest test

.PHONY: doc
doc: export PYTHONPATH=./
doc:
	cp ../../workspace/specsfinancial/CancellationCtx1.toolbox/CancellationCtx1.tex book/ch01/CancellationCtx1.tex
	cp ../../workspace/specsfinancial/CancellationMch1.toolbox/CancellationMch1.tex book/ch01/CancellationMch1.tex
	python bin/docgen.py
	cd book && pdflatex book.tex && pdflatex book.tex
