## Using the Python Client library
Do the following to instantiate a Client class that will allow you to communicate with a Socotra API:

```python
from socotra import Client
c = Client('http://localhost:8080')
c.authenticate(user_nm, pwd, tenant_loc)
```
Once you have authenticated, you may then call methods on the client object which will in turn make
calls into the Socotra API. Below are a few documented methods. See the socotra/__init__.py file for
more possibilities.

### get_tenants
This grabs a json blob of all tenants available in the system currently.

```python
tenants = c.get_tenants()
```

### add_tenant
Adds a tenant

Params:

- name (str): Name of the tenant being added
- type (str): Type of tenant

```python
c.add_tenant('Blah', 'tenant.test'))
```

### add_hostname
Adds a hostname

Params:

- id (str): The ID of the tenant
- hostname (str): The hostname of the tenant

```python
c.add_hostname(tenant_data['id'], 'balls')

```

### ping
Ensures the server is up and ready for requests

Params:

- authorized (bool): Defaults to false

```python
c.ping() # will use the endpoint that does not require login
c.ping(authorized=True) # will use the endpoint that requires login
```
