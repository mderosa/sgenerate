# Sgenerate
A book on how an application dealing with insurance contracts might be conceptualized. The book was put 
together as side project and contributed to a former employer. The inspiration was the paper, 
_Composing Contracts, An Adventure in Financial Engineering (SP Jones)_.

# Building the book
```
pipenv shell
make doc
```
The above commands build the book in the location _repo:/book/book.pdf_. The latest version of the book is
also maintained at that location in this repository.

# Common tasks
## Adding a specification files
1. Add a line to the doc task of the makefile which copies the specification files from its source into
a chapter directory of interest
2. Add a line to the bin/docgen.py file to convert a spec file to the canonical format used by the book

