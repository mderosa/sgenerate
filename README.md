# Sgenerate
A project that allows me to write about insurance contracts

# Building the book
```
pipenv shell
make doc
```

# Common tasks
## Adding a specification files
1. Add a line to the doc task of the makefile which copies the specification files from its source into
a chapter directory of interest
2. Add a line to the bin/docgen.py file to convert a spec file to the canonical format used by the book

