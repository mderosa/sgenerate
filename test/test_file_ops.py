import sgen.file_ops as Op
import unittest


class TestFileOps(unittest.TestCase):

    def test_to_standalone_tex(self) -> None:
        lns = [
            "one\n",
            "two\n",
            '\\begin{document}\n',
            "three\n",
            '\\end{document}\n',
            " "
        ]
        actual = Op.to_standalone_tex(lns)
        assert ["three\n"] == actual
