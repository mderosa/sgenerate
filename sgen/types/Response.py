from typing_extensions import TypedDict
from sgen.types.Attribute import *
from typing import List

class Response(TypedDict):
    name: str
    attributes: List[Attribute]
