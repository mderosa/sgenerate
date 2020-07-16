
## Local Development (Front End)
Install npm packages:
`npm install`
(You may have to restart VSCode after this to pick up the installed components)

Compile the app:
`npm run build`

Serve it locally via webpack-dev-server:
`npm start`

Before running locally, ensure the following environment variables are set appropriately:

```
API_URL=<url_of_backend i.e. api.develop.socotra.com>
TENANT_HOSTNAME=<your_tenant_name i.e. johndoe-configeditor.co.develop.socotra.com>
PORT=<this variable is optional. Specify port number to serve the app. i.e. 8080>
```

Note: If you load the app in a browser and log in but experience weird errors, check the console. If there's weird errors (i.e. 'Uncaught Error: Expected to find root ID'), you may need to try loading the app in a CORS-disabled browser.
On a Mac, run this command in a terminal to open a CORS-disabled version of Chrome:
`open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security`

When you run the app, you can log in with the default username and password (Note: these credentials are only available in development. They're disabled in production):
```
username: alice.lee
pw: socotra
```

If you want to log in to the 'Administration' side of the app to manage users and external integrations, you'll need to use your tenant login (not alice.lee).

## Local Development (Back End)
If you have a standard backend setup and have setup the docker-dev admin account, via
```bash
brew install jq jo
cd ~/Code/socotra-stack/docker-dev
make tenant
```
You will be able to start stack-app-static on port 8081 with the command
```bash
make run
```
With stack-app-static running you should then be able to navigate to http://docker-dev-configeditor.co.socotra.com:8081/ locally in a browser
(assuming the line '127.0.0.1 docker-dev-configeditor.co.socotra.com' in /etc/hosts) and login with the username/password 
alice.lee/socotra

To run stack-app-static along with the entire complement of Config Manager, Load Assets, and the API refer to the README.md in the root of the 
stack-config-manager directory.
