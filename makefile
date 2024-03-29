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
	cp ../../workspace/specsfinancial/IntervalOps.toolbox/IntervalOps.tex book/ch01/IntervalOps.tex

	cp ../../workspace/specsfinancial/CancellationCtx1.toolbox/CancellationCtx1.tex book/ch02/CancellationCtx1.tex
	cp ../../workspace/specsfinancial/CancellationMch1.toolbox/CancellationMch1.tex book/ch02/CancellationMch1.tex

	cp ../../workspace/specsfinancial/Policy.toolbox/Policy.tex book/ch03/Policy.tex
	cp ../../workspace/specsfinancial/CharacteristicsSplitCtx0.toolbox/CharacteristicsSplitCtx0.tex book/ch03/CharacteristicsSplitCtx0.tex
	cp ../../workspace/specsfinancial/CharacteristicsSplitMch0.toolbox/CharacteristicsSplitMch0.tex book/ch03/CharacteristicsSplitMch0.tex
	cp ../../workspace/specsfinancial/ProrationCtx2.toolbox/ProrationCtx2.tex book/ch03/ProrationCtx2.tex
	cp ../../workspace/specsfinancial/ProrationMch2.toolbox/ProrationMch2.tex book/ch03/ProrationMch2.tex
	cp ../../workspace/specsfinancial/FeesFlatCtx1.toolbox/FeesFlatCtx1.tex book/ch03/FeesFlatCtx1.tex
	cp ../../workspace/specsfinancial/FeesFlatMch1.toolbox/FeesFlatMch1.tex book/ch03/FeesFlatMch1.tex

	cp ../../workspace/specsfinancial/AutoGraceLapseInvoiceCtx0.toolbox/AutoGraceLapseInvoiceCtx0.tex book/chJobs/AutoGraceLapseInvoiceCtx0.tex
	cp ../../workspace/specsfinancial/AutoGraceLapseInvoiceMch0.toolbox/AutoGraceLapseInvoiceMch0.tex book/chJobs/AutoGraceLapseInvoiceMch0.tex
	cp ../../workspace/specsfinancial/DocConsolidateCtx0.toolbox/DocConsolidateCtx0.tex book/chJobs/DocConsolidateCtx0.tex
	cp ../../workspace/specsfinancial/DocConsolidateMch0.toolbox/DocConsolidateMch0.tex book/chJobs/DocConsolidateMch0.tex

	cp ../socotra-stack/source/stack-config-manager/README.md book/ch05/ReadMeConfigManager.md
	pandoc -f gfm -t latex -o book/ch05/ReadMeConfigManager-sa.tex book/ch05/ReadMeConfigManager.md
	cp ../socotra-stack/source/stack-app-static/README.md book/ch05/ReadMePolicyEditor.md
	pandoc -f gfm -t latex -o book/ch05/ReadMePolicyEditor-sa.tex book/ch05/ReadMePolicyEditor.md

	cp ../socotra-stack/source/stack-load-assets/README.md book/ch05/ReadMeLoadAssets.md
	pandoc -f gfm -t latex -o book/ch05/ReadMeLoadAssets-sa.tex book/ch05/ReadMeLoadAssets.md
	cp ../socotra-stack/source/stack-load-assets/docs/Api.md book/ch05/LoadAssetsApi.md
	pandoc -f gfm -t latex -o book/ch05/LoadAssetsApi-sa.tex book/ch05/LoadAssetsApi.md
	cp ../socotra-stack/source/stack-load-assets/docs/TrafficAnalysis.md book/ch05/LoadAssetsTrafficAnalysis.md
	pandoc -f gfm -t latex -o book/ch05/LoadAssetsTrafficAnalysis-sa.tex book/ch05/LoadAssetsTrafficAnalysis.md

	cp ../socotra-stack/source/stack-python-client/README.md book/ch05/ReadMePythonClient.md
	pandoc -f gfm -t latex -o book/ch05/ReadMePythonClient-sa.tex book/ch05/ReadMePythonClient.md
	cp ../socotra-stack/source/stack-python-client/docs/UsingFromPythonCode.md book/ch05/PythonClientUsingFromPythonCode.md
	pandoc -f gfm -t latex -o book/ch05/PythonClientUsingFromPythonCode-sa.tex book/ch05/PythonClientUsingFromPythonCode.md
	cp ../socotra-stack/source/stack-python-client/docs/UsingTheUtilityPrograms.md book/ch05/PythonClientUsingTheUtilityPrograms.md
	pandoc -f gfm -t latex -o book/ch05/PythonClientUsingTheUtilityPrograms-sa.tex book/ch05/PythonClientUsingTheUtilityPrograms.md

	cp ../socotra-stack/source/stack-api-service/README.md book/ch05/ReadMeStackApiService.md
	pandoc -f gfm -t latex -o book/ch05/ReadMeStackApiService-sa.tex book/ch05/ReadMeStackApiService.md
	python bin/docgen.py
	cd book && pdflatex book.tex && pdflatex book.tex
