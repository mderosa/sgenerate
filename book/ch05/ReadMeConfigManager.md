## Overview
Config Manager allows user to create, modify, and deploy custom, insurance Products.

## Local Development (Front End)
Install npm packages:
`npm install`
(You may have to restart VSCode after this to pick up the installed components)

Generate the default configuration assets as .js files:
`npm run create-assets`

Compile the app and serve it via webpack-dev-server:
`npm run start-dev`

Chances are you'll need to open the app in a browser that has CORS disabled (b/c the local frontend app will be hitting a deployed backend (as opposed to a backend hosted locally). So this will produce a CORS error). Run this command in a terminal to open a CORS-disabled version of Chrome:
`open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security`

## Local Development (Back End)
+ Boot stack-api-service on port 8080 by running it through your IDE, as usual. Stack-api-services, directly, provides login services
for config manager
+ Boot stack-load-assets on port 5000 by running the command
```bash
nvm use 8.9.4
rvm use ruby-2.6.3
make run
```
from the stack-load-assets base directory. Stack-load-assets provides all of the asset publishing services for config manager.
+ Boot stack-config-manager on port 9001 by running the command
```bash
make run
```
from the stack-config-manager base directory.

When all three applications are running you should then be able to navigate to http://localhost:9001 in any browser, login, and submit
assets all within a local development environment.

## Build and deploy
The build of Config Manager is coordinated by the build.sh (python 2) or build3.sh (python 3) in the root of the project. The shell scripts
bundle the application and deploy it to repo://source/stack-load-assets/assetload/static/configmanager. Once deployed Config Manager can
then be accessed through a running load-assets application, at the path /studio/. So for example, running load-assets locally the access url
would be
http://localhost:5000/studio/

Build and deploy using Python 3 with:
```bash
rvm use ruby-2.6.3
nvm use 8.9.4
./build3.sh
```

## Directory Layout:

- assets: Contains default configurations artifacts (i.e. default config, default product)
- public: Contains icons and image assets
- sass: Contains sass files for styling. Currently trying to move over to a BEM-style methodology
- src
	- api: Contains code to make requests to backend APIs
	- components: Contains our React components
		- actionpane: code for the actions sidebar
		- actions: Contains the Actions of the Trigger-Action component design
		- modals: Contains modal components
		- pages: Contains pages and layouts
		- popups: Contains popup components (i.e. action menus, dropdown menus). Distinct from modals in that modals are fullscreen and darken the bg. Popups and modals also currently use different underlying libraries for their implementation. They should probably be consolidated at some point.
		- various other components not organized into the above folders

	- context: Contains state management code. We're using React's Context API for state management.
	- models: Contains any complex data models (i.e. the configuration)
	- util: Contains various utility code
- history.tsx: Specifies the history library to be used with react-router
- main.tsx: The main entry point for the app
- routes.tsx: Specifies the app's URL routes. Uses react-router
