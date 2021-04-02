## Using the socotratenant program
This program allows one to submit a zipfile containing assets to a running version of load-assets. It creates or updates a tenant
An example of usage is:
```
export PYTHONPATH=$PYTHONPATH:./:../stack-monitoring
python bin/socotratenant -z ~/Code/Configs/defaultConfig.zip -u docker-dev -p socotra -a http://localhost:8080 -l http://localhost:5000 -n docker-dev-configeditor --test
```
** -z ** specifies the zip file to upload through load assets
** -u ** specifies the user name which has api access permissions
** -a ** is the endpoint of the Java api
** -l ** is the endpoint of the load assets api
** --test ** flag determines which load asset api is used to upload the zip file. If --test is specified then the assets are uploaded to the endpoint
/configuration/deployTest. If --test is not specified then the assets are uploaded to the endpoint /assets/v1/deploy. In both cases the tenant
type created in the tenant table is 'tenent.test'
** -n ** is a name related to the hostname / tenant combination that is being created or updated. How the name maps to data in the database differs depending
on the --test flag and is as follows:
1. if --test is specified, affected records are those linked to
   * tenant-hostname.hostname = [user name]-[name].co.socotra.com and 
	 tenant.tenant_name = [user name]-[name]
   * As an example, the example command, above, creates or updates data associated with 
	 tenant-hostname.hostname = docker-dev-docker-dev-configeditor.co.socotra.com 
	 tenant.tenant_name = docker-dev-docker-dev-configeditor
2. if --test is not specified, affected records are those linked to
   * tenant-hostname.hostname = [name].co.socotra.com and
	 tenant.tentant_name = [name]
   * As an example, the example command, above, without --test, would create or update data associated with 
	 tenant-hostname.hostname = docker-dev-configeditor.co.socotra.com 
	 tenant.tenant_name = docker-dev-configeditor


## Using the socortraadmin program
This program allows one to update and read information from an installation of the socortra platform. The program takes a combination of 
positional and named arguments the combination of which defines the data to read or update. One can get information on the commands
offered and the format required by the commands by using the --help argument on the command line. Examples of using the --help argument
to walk through the positional argument tree is: 
```bash
python bin/socotraadmin --help
python bin/socotraadmin tenant --help
python bin/socotraadmin tenant set_config --help
```
Some example usages of common commands in a local development environment are listed below.

### Creating a bootstrap account
The command usage is:
```
socotraadmin environment bootstrap_admin [--name NAME] [--username USERNAME]
                           [--password PASSWORD]
                           [--account_type [account.test.tenant.admin | account.internal]]
                           [--api_url] [--jwtsecret]
                           [--admin_username] [--admin_password]
```
This command is usually used to create a special account of type account.internal. These accounts are 
not associated with a tenant (the tenant is '_'), but once created the account can be used to 
log onto an instance of Config Manager, create tenants, and users for specific tenants. An example of the 
usage in a local dev environment is:
```bash
export PYTHONPATH=$PYTHONPATH:./:../stack-monitoring
python bin/socotraadmin environment bootstrap_admin --name DockerDev --username docker_dev
    --password socotra --account_type account.internal --api_url http://localhost:8080 --jwtsecret SGAGWfq31D2HRccsq87s33v1 
```

### Tenant Maintenance 
#### Adding a user to a tenant
Once a tenant exists a user can be added to the tenant with a command of the form
```
socotraadmin tenant add_user [tenant_name] [user_display_name] [username] [password] [email] [account_type]
```
where the currently supported account types are 
1. account.tenant.employee - the standard user that performs policy operations
2. account.tenant.admin - a user that can deploy configurations but can not perform policy operations
3. account.tenant.read.only.user - a user that can read but not write policy information
4. account.tenant.claims.only.user - a user that can read policy information and write only claim related information

Below is an example
of a command that creates a tenant admin account.
```bash
export PYTHONPATH=$PYTHONPATH:./:../stack-monitoring
python bin/socotraadmin tenant add_user docker-dev-configeditor Admin admin.lee socotra admin.lee@email.com account.tenant.admin
    --api_url http://localhost:8080 --jwtsecret SGAGWfq31D2HRccsq87s33v1 
	--admin_username docker-dev --admin_password socotra
```
and a command that creates a readonly user
```bash
python bin/socotraadmin tenant add_user docker-dev-configeditor ReadOnly readonly.lee socotra readonly.lee@email.com account.tenant.read.only.user 
    --api_url http://localhost:8080 --jwtsecret SGAGWfq31D2HRccsq87s33v1 
	--admin_username docker-dev --admin_password socotra
```


#### Finding the tenant info associated with a hostname
The command usage is:
```bash
socotraadmin tenant find_tenant [--api_url] [--jwtsecret]
                                [--admin_username] [--admin_password]
                                hostname
```								
This will return the contents of the tenant table in Dynamodb given a hostname. An
example of the usage in a local dev environment is:
```bash
export PYTHONPATH=$PYTHONPATH:./:../stack-monitoring
python bin/socotraadmin tenant find_tenant --api_url http://localhost:8080 --jwtsecret SGAGWfq31D2HRccsq87s33v1 --admin_username docker-dev 
    --admin_password socotra docker-dev-configeditor.co.socotra.com
```

#### Geting the tenant configuration flags
This endpoint returns a list of the tenant feature flags and their values. The command usage is:
```bash
socotraadmin tenant get_config [--api_url] [--jwtsecret]
                               [--admin_username] [--admin_password]
                               tenant_name
```
An example of the usage in a local dev environment is:
```bash
export PYTHONPATH=$PYTHONPATH:./:../stack-monitoring
python bin/socotraadmin tenant get_config --api_url http://localhost:8080 --jwtsecret SGAGWfq31D2HRccsq87s33v1 --admin_username docker-dev 
    --admin_password socotra docker-dev-configeditor
```

#### Setting a tenant configuration flag
This endpoint will set the value of a tenant level configuration flag. The names of available flags can be queried using the get_config
option, above. The command usage is:
```bash
socotraadmin tenant get_config [--api_url] [--jwtsecret]
                               [--admin_username] [--admin_password]
							   [--config_uri] [--config-value]
                               tenant_name
```
An example of the usage in a local dev environment is:
```bash
export PYTHONPATH=$PYTHONPATH:./:../stack-monitoring
python bin/socotraadmin tenant set_config --api_url http://localhost:8080 --jwtsecret SGAGWfq31D2HRccsq87s33v1 --admin_username docker-dev 
    --admin_password socotra docker-dev-configeditor property.proration.plugin.enabled true
```
