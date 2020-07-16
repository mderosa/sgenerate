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
This program allows one to update and read information from an installation of the 
socortra platform. The program takes a combination of positional and named arguments
the combination of which defines the data to read or update. Some example usages in 
a local development environment are listed below

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

### Adding a user to a tenant
Once a tenant exists a user can be added to the tenant with a command of the form
```
socotraadmin tenant add_user [tenant_name] [user_display_name] [username] [password] [email] [account_type]
```
where the currently supported account types are account.tenant.employee | account.tenant.admin. Below is an example
of a command that creates a tenant admin account.
```bash
export PYTHONPATH=$PYTHONPATH:./:../stack-monitoring
python bin/socotraadmin tenant add_user docker-dev-configeditor Admin admin.lee socotra admin.lee@email.com account.tenant.admin
    --api_url http://localhost:8080 --jwtsecret SGAGWfq31D2HRccsq87s33v1 
	--admin_username docker-dev --admin_password socotra
```

### Finding the tenant info associated with a hostname
The command usage is:
```
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
