import sgen.file_ops as Op


def main() -> None:
    Op.mk_standalone_tex('book/ch02/CancellationCalculations.tex')
    Op.mk_standalone_tex('book/ch02/CancellationCtx1.tex')
    Op.mk_standalone_tex('book/ch02/CancellationMch1.tex')
    print("success")


if __name__ == "__main__":
    main()
