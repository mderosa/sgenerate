## Overview
Load assets takes configuration files from Configuration Manager, validates
them, and then orchestrates though the stack-api-service to configure data stores
needed for operation of the software

## Development environment setup
Load assets can be run locally on a developer computer against a locally running instance 
of stack-api-service on port 8080. To setup your environment
you can run the command
```bash
make setup-debian
```
or 
```bash
make setup
```
depending on the type of system you are on. The setup process (1) installs pyenv
to manage your virtual environments, (2) installs pipenv and (3) installs all of the dependencies for the stack-load-assets project

After running the setup you should then be able to start your virtual environment by typing:
```bash
pipenv shell
```
and exit the virtual environment by typing:
```bash
exit
```

## Running the application
The application can be run on port 5000 by entering your virtual environment and then entering the command 
```bash
make run
```
The makefile sets up all of the environment variables needed for the application
to run against a locally running stack-api-service

## Testing the application
Tests can be run from inside the virtual environment as described below.

+ static analysis and type checking is run as part of all the test routines. Both types of checks can also be
run stand alone. Static analysis can be run with the command:
```bash
make static
```
Type checking can be run with the comamnd:
```bash
make mypy
```

+ unit tests can be run with the command:
```bash
make test
```

+ There are currently integration tests for stack-load-assets that run against a locally
running stack-api-service. The integration tests can be run with the command:
```bash
make test_intg
```
