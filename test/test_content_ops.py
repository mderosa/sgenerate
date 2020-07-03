import unittest
import sgen.content_ops as C


class TestContentOps(unittest.TestCase):

    def test_take_after(self) -> None:
        xs = ["one", "two", "three", "four", "five"]
        actual = C.take_after(lambda s: s == "two", xs)
        self.assertEqual("three", actual[0])
        self.assertEqual("five", actual[-1])

    def test_take_before(self) -> None:
        xs = ["one", "two", "three", "four", "five"]
        actual = C.take_before(lambda s: s == "four", xs)
        self.assertEqual("one", actual[0])
        self.assertEqual("three", actual[-1])
