from typing import List, Callable


def take_after(fn: Callable[[str], bool], lines: List[str]) -> List[str]:
    pos = -1
    for i in range(0, len(lines)):
        if fn(lines[i]):
            pos = i + 1
            break
    assert pos != -1, "unable to find target line"
    return lines[pos:]


def take_before(fn: Callable[[str], bool], lines: List[str]) -> List[str]:
    pos = -1
    for i in range(0, len(lines)):
        if fn(lines[i]):
            pos = i
            break
    assert pos != -1, "unable to find target line"
    return lines[:pos]
