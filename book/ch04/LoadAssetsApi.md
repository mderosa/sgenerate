## Api Overview
There are a documented and non documented API endpoints for the load assets project. A schema for the 
documented API can be viewed on a development machine at
[Api Schema](http://localhost:5000/api/swagger.json)
A brief discusion of all API endpoints are described below.

## Api Detail
### POST /assets/v1/deploy
Creates or updates a tenant-hostname / tenant combination
Request
```json
{
	zipFile: Bytes,
	tenantName: String
}
```
* _zipFile_ : A zipped directory of socotra configuration files
* _tenantName_ : Creates or updates a configuration such that tenant-hostname.hostname =
  [tenantName].co.socotra.com and tenant.tenant.tenant_name = [tenantName]


Response
```json
{
	hostname: String,
	logfile: String,
	success: Boolean
}
```
* _hostname_ : the hostname (ex: docker-dev-configeditor.co.socotra.com) at which one can access the uploaded configuration
  given the uploaded credentials (ex: alice.lee / socotra)

### /assets/v1/deployTest
Creates or updates a tenant-hostname / tenant combination
Request
```json
{
	zipFile: Bytes,
	tenantNameSuffix: String
}
```
* _zipFile_ : A zipped directory of socotra configuration files
* _tenantName_ : Creates or updates a configuration such that tenant-hostname.hostname =
  [username]-[tenantName].co.socotra.com and tenant.tenant.tenant_name = [username]-[tenantName], where
  [username] is the admin user contained in the authorization credentials

Response
```json
{
	hostname: String,
	logfile: String,
	success: Boolean
}
```
* _hostname_ : the hostname (ex: docker-dev-configeditor.co.socotra.com) at which one can access the uploaded configuration
  given the uploaded credentials (ex: alice.lee / socotra)

### /assets/v1/export
Request
```json
{
	? includeFailed: Boolean
}
```

Response
```json
{
	deployed: Boolean,
	expiresTimestamp: Integer,
	url: String
}
```

### /assets/v1/login
### /assets/v1/createAdmin

### /configuration/deployTest
Request
```json
{
	zipFile: Bytes,
	? tenantNameSuffix: String
}
```

Response
```json
{
	hostname: String,
	logfile: String,
	success: Boolean,
	tenantName: String
}
```

### /configuration/updateExternalServiceIntegrations


## End Points For Config Studio
### POST /configeditor/deploy
This end point is used by Config Studio to submit assests to the Socotra main api service.
Requires that the client set an 'authorization' field in the header containing a authorization
header

The request should contain a json body of the form
```json
{
	assets: Map<String, JSON>
	recreate: Boolean
}
```
ex:
```json
{
	assets:{
		config.json: {timezone: "America/Los_Angeles", currency: "USD", improvedRating: true}",
		security/roles.json: {underwriter1: "Underwriter Level 1", underwriter2: "Underwriter Level 2"},
		...
	},
	recreate: false
}

```

The response will be of the form
```json
{
	hostname: String,
	logfile: String,
	success: Boolean
}
```

### POST /configeditor/validate
This end point is used by Config Studio to check if asset files are valid. The client does not need to set
and 'authorization' header.

The request should contain a json body of the form
```json
{
	assets: Map<String, JSON>
}
```

The response will be of the form
```json
{
	"config.json":null,
	"payment/payment.json":null,
	"policyholder/policyholder.card.json":null,
	...
}
```
where null indicates that the corresponding file has passed validation

### /configeditor/import
### /configeditor/export

## Monitoring End Points
### GET /health
Just a health check endpoint for monitoring. The response is of the form
```json
{
    "duration_millis": 0.011139154434204102, 
    "generated_at": "2020-02-07T22:20:58Z", 
    "result": "passed", 
    "tests": {
        "core_api": {
            "duration_millis": 0.011105060577392578, 
            "result": "passed", 
            "tested_at": "2020-02-07T22:20:58Z"
        }
    }
}
```
