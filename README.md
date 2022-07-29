# Sgenerate
A book on how an application dealing with insurance contracts might be conceptualized. This was put 
together as side project, contributed to a former employer. The inspiration was the paper, 
Composing Contracts, _An Adventure in Financial Engineering (SP Jones)_.

# Building the book
```
pipenv shell
make doc
```
This build the book in the location repo:/book/book.pdf, where it can be found in this repository

# Common tasks
## Adding a specification files
1. Add a line to the doc task of the makefile which copies the specification files from its source into
a chapter directory of interest
2. Add a line to the bin/docgen.py file to convert a spec file to the canonical format used by the book

