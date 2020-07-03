.PHONY: mypy
mypy:
	mypy -p sgen -p test
	mypy bin/*.py

.PHONY: mypy
test: mypy
	flake8 sgen test
	pytest test

.PHONY: doc
doc:
	cp ../../workspace/specsfinancial/CancellationCtx1.toolbox/CancellationCtx1.tex book/ch01/CancellationCtx1.tex
	cp ../../workspace/specsfinancial/CancellationMch1.toolbox/CancellationMch1.tex book/ch01/CancellationMch1.tex
	cd book && pdflatex book.tex
