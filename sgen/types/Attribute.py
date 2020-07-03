from typing_extensions import TypedDict
# from typing import List


class Attribute(TypedDict):
    name: str
    overrideAnnotation: bool
    description: str
    # subAttributes: List['Attribute']
