## Overview
The stack-python-client package provides an interface for communicating with the stack-api-service. There are
several utility programs in the bin directory with can be used to setup a client. In addition this package
is used by stack-load-assets to help upload zip asset files.

## Development environment setup
This library is a dependency of the stack-load-assets application and its development setup procedures are similar
to stack-load-assets. To setup your development environment for working on stack-python-client, from the project
base directory type:
```bash
make setup
```
This will install pyenv, pipenv and lastly install the project dependences. After running the setup you should
then be able to start your virtual environment by typing:
```bash
pipenv shell
```
and exit the virtual environment by typing:
```bash
exit
```

## Testing the application
You will be able to run tests in your development environment by activating your virtual environment (see: Development
setup) and entering the commands below.

+ Static analysis can be run with pylint through the command
```
make static
```

+ The unit tests can be run wit the command
```
make test
```

+ The integration tests can be run by booting the Java API running on port 8080 and then entering the command
```
make test_intg
```
