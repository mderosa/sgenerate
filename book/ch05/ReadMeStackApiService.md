## Overview
stack-api-service is the highest layer in the Socotra platform. It depends on the statck-service-common
project for business and persistence services. It despends on the stack-api-client project for generic and
specialized model classes.


## Testing 
### Overview
Testing is organized so that a developer can run unit tests and an essential subset of the
integration tests locally on a development machine. These unit and essential integration
tests  are referred to as the essential test subset and satisfy the following criteria:
+ Runs must of the essential test subset must run within a time budget of 15 minutes.
+ The essential test subset may be run locally by a developer, but the essential subset must run
and pass before developers are allowed to merge a pull request into the develop branch.

The full set of project tests, which is a superset of the essential subset, is run continuously by the
automated build tools. A failure of the full set indicates a code issue on the develop branch and
must be resolved by the team as a their first priority.


### Running tests
+ The unit tests for stack-service-common will run on any machine with a Java installation. The 
unit tests can be run by the command
```bash
make test
```
This command insures the local maven repository contains a build of the latest branch specific
Java libraries and runs all of the Java unit tests in the socotra-stack project. If one would
like to run just the unit tests for the stack-api-service project, that can be done by issuing the 
command 
```bash
mvn test
```
from the root of the project.

+ The essential test subset, as defined above, for stack-service-common will run on any machine with a
standard development environment. The essential subset can be run by the command
```
make test_intg
```
If a developer would like to run just the essential test subset for the stack-service common project alone, that
can be done by issuing the command 
```bash
mvn verify -P essential-test
```
from the root of the project.

+ Currently the full set of project tests will run with the command.
```
mvn verify -P integration-test
```
A developer machine will likely choke on the processing that will ensue after this command so you really 
don't want to run all the tests. Still, everyone should be familiar with the tests commands that are used
in the orgainization.
