
## To run locally:
### Front end development
Install npm packages:
`npm install`
(You may have to restart VSCode after this to pick up the installed components)

Generate the default configuration assets as .js files:
`npm run create-assets`

Compile the app and serve it via webpack-dev-server:
`npm run start-dev`

Chances are you'll need to open the app in a browser that has CORS disabled (b/c the local frontend app will be hitting a deployed backend (as opposed to a backend hosted locally). So this will produce a CORS error). Run this command in a terminal to open a CORS-disabled version of Chrome:
`open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security`

build.sh is for production use only. It will throw errors if run locally.

### Back end development
If you have a standard backend setup and have setup the docker-dev admin account, via
```bash
brew install jp jo
cd ~/Code/socotra-stack/docker-dev
make tenant
```
You will be able to run config manager locally along with Load Assets and the API with the following procedure:
+ Boot stack-api-service on port 8080 by running it through your IDE, as usual. Stack-api-services, directly, provides login services
for config manager
+ Boot stack-load-assets on port 5000 by running the command 
```bash
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

## Trigger-Action component design

This app contains numerous instances where we render some user-interactable component (i.e. a button) and then when the user interacts with it (i.e. clicks it), the app will perform some action.

The **Trigger** is the code for rendering the user-interactable component.

The **Action** is the code for what happens when the user has activated the Trigger.

### Motivation

1. We often use the same trigger to do different actions. Ex: we use the same 'Remove' button as a trigger to remove different configuration items (i.e. we can remove products, exposures, perils, tables, documents, etc). Where the button appears contextually determines what item is being removed.
2. We use different triggers that end up performing the same action. Ex: We can clone a product from the Add New Product Modal or from the action menu on a specific product.
3. We sometimes want to chain actions together. We want an easy way to reuse actions in this scenario without requiring a rendered trigger for each action in the chain.

## How to change default assets:

1. Find the file in `assets/default` that you want to change.
2. Run `python generate_default_editor_assets.py` for TS code gen.
3. Commit changes, and land them in `develop`. See: "more notes" below.

If you want to test the change (much harder) using a locally built image:

* Terminate containers w/ `make stop -C $REPO_ROOT/socotra-stack/docker-dev`
* Run the `Rakefile` target named `preenvironment:asset_load_server:build`

This copied the static files into the "load assets" project; rebuild the image:

* `cd $REPO_ROOT/docker-loadassets; docker build . -t socotra/loadassets:master`
* Restart containers w/ `make services -C $REPO_ROOT/socotra-stack/docker-dev`

On `http://localhost:5000/studio/`, the container will now have local changes.

## More Notes

Since the user's changes are saved in-browser, you may need to:
```
localStorage.clear()
location.reload()
```

If you have problems running `rake` try:
```
gem install httpclient java-properties vault
export RUBYLIB="$REPO_ROOT/socotra-stack/rakelib/lib"
```

If `node` or `npm` complains, did you remember to:
```
nvm install lts/carbon # and do you have XCode installed?
export NPM_CONFIG_REGISTRY=https://registry.npmjs.org/
```

Ask #engineering after reading the scripts to troubleshoot problems:
```
cd $REPO_ROOT/socotra-stack && mkdir -p logs
rake preenvironment:asset_load_server:build -n
```
