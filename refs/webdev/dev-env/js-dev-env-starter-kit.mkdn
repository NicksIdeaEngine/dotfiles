# JavaScript Developer Environment Starter Kit

**Summary:** Notes I took while going through Pluralsight's [Building a JavaScript Development Environment](https://www.pluralsight.com/courses/javascript-development-environment). This course taught me a wide range of amazing stuff. It's my favorite course so far!

## Set Up GitHub

- Create remote repository on GitHub
- Create local repository via - git init
- Create .gitignore file - Optional: To privately exclude files, edit .git/info/exclude
- Connect the local and remote repo with - git remote add origin <repo URL>
- Stage existing files and folders - git add .
- Commit changes locally - git commit -m "added new feature"
- Push changes to master branch of remote repo - git push origin master

## Editors & Configuration

- Build .editorconfig file in root dir

## Package Management

- Create package.json file in root dir
- scripts
  - prestart (automation)
  - start (automation)
  - open:src (automation)
  - localtunnel (web server)
  - share (web server)
- dependencies:
  - bootstrap
  - jquery
  - popper.js
- devDependencies
  - @babel/cli (transpiling)
  - @babel/core (transpiling)
  - @babel/node (transpiling)
  - @babel/preset-env (transpiling)
  - babel-loader (transpiling)
  - browser-sync (web server)
  - chalk (automation)
  - css-loader (bundling)
  - eslint (linting)
  - eslint-plugin-import (linting)
  - eslint-watch (linting)
  - express (web server)
  - localtunnel (web server)
  - npm-run-all (automation)
  - numeral (bundling test)
  - open (editors and configuration)
  - style-loader (bundling)
  - webpack (bundling)
  - webpack-dev-middleware (bundling)
- Install/update Nodejs
- Install/update local npm

## Development Web Server

- Install express and add to devDependencies - npm i -D express
- Install localtunnel and add to devDependencies - npm i -D localtunnel
- Install Browsersync and add to devDependencies - npm i -D browser-sync

## Automation

- Add scripts for: - prestart - node buildScripts/startMessage.js - Creates start message in terminal before "start" is run - start - npm-run-all --parallel open:src - Runs "open:src" (and ready for other parallel operations) - open:src - node buildScripts/srcServer.js - Creates express webserver - localtunnel - lt --port 8080 - Creates localtunnel webserver at port 8080 - share - npm-run-all --parallel open:src localtunnel - Creates express and localtunnel webserver

## Transpiling

- Make sure Babel is set up correctly with all the needed packages based on what else you're running
- Change in package.json scripts:  "node" to "npx babel-node" so it transpiles when using npm start
- Create .babelrc file with "@babel/preset-env" as the preset

## Bundling

- Make sure you're using ES6 Modules (not IIFEs)
- Make sure Webpack is set up correctly with all needed packages based on what else you're running
- Create webpack.config.dev.js in root dir
- You can use debugger; to test that source map is working

## Linting

- Set up .eslintrc.json file
- Set up babel presets with babel and webpack
- Set up scripts for npm run lint and npm run lint:watch

## Testing & Continuous Integration

- Framework: Mocha - Add /buildScripts/testSetup.js - Add "test" to package.json - Add /src/index.test.js
- Assertion Library: Chai
- Helper Libraries: JSDOM
- Where to run tests: Node
- Where to place tests: Alongside
- When to run tests: Upon save - Add "test:watch" to npm scripts, add "test:watch" to "start" script

## HTTP Calls

- Manually create API to make a call to - Added /api/userApi.js to test API calling - Added new app.get to srcServer.js to call - Added test table structure to index.html - Adjusted index.test.js to look for <h1>Users</h1>
- Use json-schema-faker and json-server to simulate making real API calls to data that is randomly generated based on schema settings - Mock Data Creation - Create mockDataSchema.js to design and export the shape of our mock API - Create generateMockData.js to use json-schema-faker for creating mock data based on mockDataSchema.js - Create npm script to automate mock data generation - Serving the Mock Data - Create npm script to automate starting the mock API server - Create npm script to automate generating new data before each start-mockapi via prestart-mockapi - Add start-mockapi to npm start - Manipulating Mock Data - From userApi.js, export deleteUser(id) function and make the del(url) function it returns the results of - In index.js, store elements with class "deleteUser" into a const and make an Array.from(that) which adds a click event that calls deleteUser to remove from json data, then removes that row from DOM

## Project Structure

- Create a demo app to exemplify directory structure and file naming, framework usage, testing, and mock API
- JS goes in .js files, and dynamically generated JS logic is better via JSON config objects
- Organize by feature instead of filetype
- Extract logic to POJOs (plain old javascript objects).  Pure logic. No framework-specific code.
- When working with React, your logic should be as outside of react components as possible.

## Production Build

- Create webpack.config.prod.js (copy of webpack.config.dev.js)
- Create build.js
- Create distServer.js (copy of srcServer.js)
- Add clean-dist, prebuild, build, and postbuild npm scripts
- Set up html-webpack-plugin
- Make sure HTML is getting minified and deployed to /dist/
- Set up chunking via webpack.config.optimization.splitChunks
- Set up cache busting with webpack-md5-hash
- Use mini-css-extract-plugin to minify and hash CSS files
- Set up error logging via Sentry / EmbeddedJS - Edited index.html to dynamically use Sentry only in production

## Production Deploy

- Use Heroku as a Node friendly host for our API - Use "cors" to enable Cross Origin Resource Sharing (cross origin calls between different domains) - Use app.json to describe our app to Heroku - Procfile is a Heroku file that declares the command Heroku should run - After logging into Heroku via CLI, run "heroku create" to receive the URL - Add the heroku URL to your git remote list - heroku git:remote -a <your unique heroku URL> - Push to heroku master - git push heroku master - Add the heroku URL to baseUrl.js - surge info - Main email - Frakshun.0489 - Add "deploy" npm script - surge ./dist
- Keeping projects updated - What will I use?  Yeoman, Github, or npm?
