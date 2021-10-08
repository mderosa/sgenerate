import sgen.file_ops as Op


def main() -> None:
    Op.mk_standalone_tex('book/ch01/Policy.tex')
    
    Op.mk_standalone_tex('book/ch02/CancellationCtx1.tex')
    Op.mk_standalone_tex('book/ch02/CancellationMch1.tex')

    
    Op.mk_standalone_tex('book/ch03/CancellationCalculations.tex')
    Op.mk_standalone_tex('book/ch03/CharacteristicsSplitCtx0.tex')
    Op.mk_standalone_tex('book/ch03/CharacteristicsSplitMch0.tex')
    Op.mk_standalone_tex('book/ch03/IntervalOps.tex')
    Op.mk_standalone_tex('book/ch03/ProrationCtx2.tex')
    Op.mk_standalone_tex('book/ch03/ProrationMch2.tex')
    Op.mk_standalone_tex('book/ch03/FeesFlatCtx1.tex')
    Op.mk_standalone_tex('book/ch03/FeesFlatMch1.tex')

    Op.mk_standalone_tex('book/chJobs/AutoGraceLapseInvoiceCtx0.tex')
    Op.mk_standalone_tex('book/chJobs/AutoGraceLapseInvoiceMch0.tex')
    Op.mk_standalone_tex('book/chJobs/DocConsolidateCtx0.tex')
    Op.mk_standalone_tex('book/chJobs/DocConsolidateMch0.tex')

    print("success")


if __name__ == "__main__":
    main()
