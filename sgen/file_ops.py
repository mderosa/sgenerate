from typing import List
import sgen.content_ops as Op


def mk_standalone_tex(path: str) -> None:
    assert path.endswith(".tex"), f"invalid tex file: {path}"
    with open(path, 'r') as hdl:
        lns = hdl.readlines()
    ys = to_standalone_tex(lns)

    path_gen = path.replace(".tex", "-sa.tex")
    with open(path_gen, 'w') as hdl:
        hdl.writelines(ys)


def to_standalone_tex(lns: List[str]) -> List[str]:
    ys = Op.take_after(lambda y: y.startswith('\\begin{document}'), lns)
    return Op.take_before(lambda z: z.startswith('\\end{document}'), ys)
