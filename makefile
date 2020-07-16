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
	cp ../../workspace/specsfinancial/Policy.toolbox/Policy.tex book/ch01/Policy.tex
	cp ../../workspace/specsfinancial/CancellationCtx1.toolbox/CancellationCtx1.tex book/ch02/CancellationCtx1.tex
	cp ../../workspace/specsfinancial/CancellationMch1.toolbox/CancellationMch1.tex book/ch02/CancellationMch1.tex
	cp ../socotra-stack/source/stack-config-manager/README.md book/ch04/ReadMeConfigManager.md
	pandoc -f gfm -t latex -o book/ch04/ReadMeConfigManager-sa.tex book/ch04/ReadMeConfigManager.md
	cp ../socotra-stack/source/stack-app-static/README.md book/ch04/ReadMePolicyEditor.md
	pandoc -f gfm -t latex -o book/ch04/ReadMePolicyEditor-sa.tex book/ch04/ReadMePolicyEditor.md

	cp ../socotra-stack/source/stack-load-assets/README.md book/ch04/ReadMeLoadAssets.md
	pandoc -f gfm -t latex -o book/ch04/ReadMeLoadAssets-sa.tex book/ch04/ReadMeLoadAssets.md
	cp ../socotra-stack/source/stack-load-assets/docs/Api.md book/ch04/LoadAssetsApi.md
	pandoc -f gfm -t latex -o book/ch04/LoadAssetsApi-sa.tex book/ch04/LoadAssetsApi.md
	cp ../socotra-stack/source/stack-load-assets/docs/TrafficAnalysis.md book/ch04/LoadAssetsTrafficAnalysis.md
	pandoc -f gfm -t latex -o book/ch04/LoadAssetsTrafficAnalysis-sa.tex book/ch04/LoadAssetsTrafficAnalysis.md

	cp ../socotra-stack/source/stack-python-client/README.md book/ch04/ReadMePythonClient.md
	pandoc -f gfm -t latex -o book/ch04/ReadMePythonClient-sa.tex book/ch04/ReadMePythonClient.md
	cp ../socotra-stack/source/stack-api-service/README.md book/ch04/ReadMeStackApiService.md
	pandoc -f gfm -t latex -o book/ch04/ReadMeStackApiService-sa.tex book/ch04/ReadMeStackApiService.md
	python bin/docgen.py
	cd book && pdflatex book.tex && pdflatex book.tex
