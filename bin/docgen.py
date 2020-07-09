import sgen.file_ops as Op


def main() -> None:
    Op.mk_standalone_tex('book/ch01/CancellationCalculations.tex')
    Op.mk_standalone_tex('book/ch01/CancellationCtx1.tex')
    Op.mk_standalone_tex('book/ch01/CancellationMch1.tex')
    print("success")


if __name__ == "__main__":
    main()
