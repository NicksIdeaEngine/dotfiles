# Practical HTML 5 has examples of:

- HTML5 semantic tags
- Forms/validation
- CSS3 modules
- Drag and Drop API
- Web Storage
- Geolocation
- Using the new <audio> and <video> elements
- Using canvas
- Using SVG

# Brad's React Crash Course

- create-react-app for setting up hot reloading, easy build tool, etc

## Installing create-react-app

- https://github.com/facebook/create-react-app
- use "npx create-react-app ." to install in current directory
- cd into directory if needed
- use "npm start"

# Project Ideas

- Course platform
- Slack clone
- Email client
- Trip packer
- Quiz/survey builder
- Blog + editor
- Website analytics
- Customizable dashboard with graphs
- Shopping site with cart
- Notes recorder (audio)
- Weather app
- Podcast player
- Activity tracker
- Habit tracker
-

# Notes from JavaScript: Understanding the Weird Parts

> "Don't imitate. Understand!"

## Vocabulary

### Execution Contexts and Lexical Environments

- **Syntax Parser** - A program that reads your code and determines what it does and if its grammar is valid.
- **Lexical Environment** - Where something sits physically in the code you write.
- **Execution Context** - A wrapper to help manage the code that is running.
- **Name/Value Pair** - A name which maps to a unique value.
- **Object** - A collection of name/value pairs.
- **Global Execution Context** - The base execution context.
  - The Global Execution Context creates a Global Object and `this` whenever JavaScript code runs.
  - This can be seen on a webpage that just has an HTML and JS file which is mostly empty aside from foundational code
  - 'Global' means 'not inside a function'
  - 'Global Object' and `this` are equal to each other when `this` is run on the global level (the window)
  - 'Outer Environment' is null for the Global Object.  There is no outer environment beyond global.
  - Your code runs within the global environment.
- **Execution Context** - Creation and Hoisting

# Notes from JavaScript Closures from CodingBlocks.net

[From Here](http://www.codingblocks.net/videos/javascript-closure-what-they-are-and-how-they-are-useful/)

The problem that closures can solve is that there are no private variables in JavaScript Object Oriented Programming.

When you have a function like the code below, you have public variables that are easily accessible and tampered with.

```javascript
function Person(firstName, lastName) {
  this.setFirstName = function(val) {
    this.firstName = val.toUpperCase();
  };
  this.getFirstName = function() {
    return this.firstName;
  };
  this.setLastName = function(val) {
    this.lastName = val.toUpperCase();
  };
  this.getLastName = function() {
    return this.lastName;
  };
  this.getFullName = function() {
    return this.getFirstName() + ' ' + this.getLastName();
  };
  this.setFirstName(firstName);
  this.setLastName(lastName);
}

var john = new Person('John', 'Doe');
console.log(john.getFullName());
john.lastName = 'Dough';
console.log(john.getFullName());
```

This outputs:

    JOHN DOE
    JOHN Dough

JavaScript Closures can get around the issue that JavaScript doesn't have private instance variables.  You never want global variables.  Closures is the answer!

```javascript
function PersonClosure(firstName, lastName) {
     var _firstName, _lastName; (Setting variables within a function makes them private (scoped to that function). Closures allow methods inside a function to access variables outside of themselves (like the functions below that are inside PersonClosure))
     this.setFirstName = function(val){
         _firstName = val.toUpperCase();
     };
     this.getFirstName = function(){
          return  _firstName ;
     };
     this.setLastName = function(val){
           _lastName  = val.toUpperCase();
     };
     this.getLastName = function(){
          return  _lastName;
     };
     this.getFullName = function(){
         return this.getFirstName() + " " + this.getLastName();
     };
     this.setFirstName(firstName);
     this.setLastName(lastName);
}

var jane = new PersonClosure('Jane', 'Doe');
jane.lastName = 'Dough';
console.log(jane.getFullName());
console.log(jane.lastName);
jane.setFirstName('janette');
```

This outputs:

    JANE DOE
    Dough
    JANETTE DOE

In this case for output line #2, we set a new variable that is not used within the PersonClosure object. It's more like a new property for that object instead of changing the existing one.  You'd need to use the setLastName method to do it right.

# Misc HTML Notes

You can set alternate sized images to be used based on different viewports

```html
<img
  src="wired-brain-coffee-logo.png"
  alt="wiredbraincoffee.com"
  srcset="logo.png 500w, logo-250.png 250w"
  sizes="(max-width: 30em) 25vw, 33vw"
/>
```

You can use the <picture> element to select images based on media queries and/or supported image formats

```html
<!-- Picture selected based on image type -->
<picture>
  <source type="image/jpeg" srcset="" sizes="" />
  <source type="image/png" srcset="" sizes="" />
  <img src="" alt="" />
</picture>
<!--  Picture selected based on media queries -->
<picture>
  <source
    media="(min-width:750px)"
    srcset="
      wired-brain-coffee-logo-250.jpg 250w,
      wired-brain-coffee-logo.jpg     500w
    "
    sizes="(max-width: 1000px) 25vw, (min-width: 1000px) 15vw"
  />

  <source
    srcset="
      wired-brain-coffee-logo-250.png 250w,
      wired-brain-coffee-logo.png     500w
    "
    sizes="(max-width: 500px) 15vw, 25vw"
  />

  <img src="wired-brain-coffee-logo.png" alt="Wired Brain Coffee Logo" />
</picture>
```

# Git Commands Quick Ref

[From Here](https://confluence.atlassian.com/bitbucketserver/basic-git-commands-776639767.html)

- git init
  - Initialize the local directory as a Git repo
- git add .
  - Adds files in the local repo and stages them for commit
- git reset HEAD YOUR-FILE
  - Unstages a file
- git commit -m "First commit"
  - Commits the tracked changes and preps them to be pushed to a remote repo
- git reset --soft HEAD~1
  - Removes this commit for modifying files (after using that command, commit again?...before adding the file back)
- git remote add origin remote repo URL
  - Sets the new remote
- git remote -v
  - Verifies the new remote URL
- git push origin master
  - Pushes changes in local repo up to the remote origin repo
- git rm --cached foo.txt
  - Remove files from working tree and from the index (main repo)

# Notes on UX Design Course

[From Here](https://www.youtube.com/watch?v=68w2VwalD5w)

## Roles Involved With Creating Websites & Apps

- UI Designer - The person responsible for "making things".  You'll oversee design selections and consistent implementation across the user's experience.  Icons, fonts, colors, etc.
- UX Designer - Potentially all of the UI responsibilities, plus thinking through the brief provided by the client, personas of targeted users, testing the experience and bringing those results back to the team, etc.
- Product Designer - Has a global sense of the product, oversees timelines and goals and budgets, helps ensure everyone is moving along and coming together at the right pace, mostly a "big picture" organizational role.
- If you're at a small operation or working for yourself, you are potentially multiple or all of these roles.

## The UX Brief

- Project name
- Project description
- Who is this for?
- Feature List (product requirements)
- Competitors & Product Inspiration
- Deliverables
  - Wireframes for client approval
  - High fidelity prototype for the tutor focused product
  - User Testing
    - For this test we'll be using Hallway testing, Unmoderated remote testing.
  - Usability report
  - UI Assets for developers
  - Not included:  We will not be prototyping or testing the end user side of this product.  This side of the product is where students sign up for courses from the tutor. BYOL plans to use the existing front end.
- Cost
  - Include overall cost, plus an hourly cost for additional work outside of the brief.
  - Include down payment conditions.
- Timeline / Deadline

## The UX Persona

- Can be brief or highly detailed all the way to what car they drive, favorite food, etc.
- Come up with a quote from them based on how they would frame their problem that we are solving
- What kind of background do they have?  Where did they go to school?  What do they do?  What kind of family and lifestyle do they have?  What are their strengths, weaknesses, hopes, dreams, fears, worries, frustrations?

# Notes on Building a JS Dev Environment

From the Pluralsight course

## Why a Starter Kit?

- Codifies
  - Decisions
  - Best practices
  - Lessons learned
- Encourages consistency
- Avoids forgetting important details
- Increases quality
  - Doing the "right" thing is the easy thing to do
- Avoids repeating work
- A starter kit is a living, automated, and interactive checklist.

## Intro

### What belongs in your starter kit?

- Package management
- Bundling
- Minification
- Sourcemaps
- Transpiling
- Dynamic html generation
- Centralized http
- Mock api framework
- Component libraries
- Development webserver
- Linting
- Automated testing
- Continuous integration
- Automated build
- Automated deployment
- Working example app

### Setting Up GitHub

- git init
- git remote add origin _repo URL_
- git add .
  - Stage all changed files
- git commit -m "added new feature"
  - Commit changes locally
- git push
  - Push work to GitHub

### You need a starter kit

- Reduce decision fatigue
- Right thing becomes automatic
- Codifies lessons learned
- Rapid feedback
- Automated checklist

### Editors and Configuration

Using .editorconfig is a great way to have unified settings among a team and projects.

```
# editorconfig.org
root = true


[*]
indent_style = space
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true


[*.md]
trim_trailing_whitespace = false
```

### Package Management

Using package.json is a great way to manage node packages among a team and projects.

```
{
  "name": "javascript-development-environment",
  "version": "1.0.0",
  "description": "JavaScript development environment Pluralsight course by Cory House",
  "scripts": {
    "prestart": "babel-node buildScripts/startMessage.js",
    "start": "npm-run-all --parallel security-check open:src lint:watch test:watch start-mockapi",
    "open:src": "babel-node buildScripts/srcServer.js",
    "lint": "esw webpack.config.* src buildScripts --color",
    "lint:watch": "npm run lint -- --watch",
    "security-check": "nsp check",
    "localtunnel": "lt --port 3000",
    "share": "npm-run-all --parallel open:src localtunnel",
    "test": "mocha --reporter progress buildScripts/testSetup.js \"src/**/*.test.js\"",
    "test:watch": "npm run test -- --watch",
    "generate-mock-data": "babel-node buildScripts/generateMockData",
    "prestart-mockapi": "npm run generate-mock-data",
    "start-mockapi": "json-server --watch src/api/db.json --port 3001",
    "clean-dist": "rimraf ./dist && mkdir dist",
    "prebuild": "npm-run-all clean-dist test lint",
    "build": "babel-node buildScripts/build.js",
    "postbuild": "babel-node buildScripts/distServer.js",
    "deploy": "surge ./dist"
  },
  "author": "Cory House",
  "license": "MIT",
  "dependencies": {
    "whatwg-fetch": "1.0.0"
  },
  "devDependencies": {
    "babel-cli": "6.16.0",
    "babel-core": "6.17.0",
    ...
    "webpack-md5-hash": "0.0.5"
  }
}
```

Use npm install once the package.json file is created.

### Development Web Server

Dev Web Server options:

- http-server - Ultra-simple.  Single command servers current directory.
- live-server - Lightweight.  Support live-reloading.
- Express - Comprehensive.  Highly configurable.  Production grade.  Can run it anywhere.
- budo - Integrates with Browserify.  Includes hot reloading.
- Webpack Dev Server - Built into Webpack.  Servers from memory.  Includes hot reloading.
- Browsersync - Dedicated IP for sharing work on LAN.  All interactions remain in sync!  Great for cross-device testing.  Integrates with Webpack, Browserify, Gulp.
  Sharing Work-In-Progress options:
- localtunnel - Easily share work on your local machine (can use browsersync with this!)
  - Setup:
    - npm install localtunnel -g
    - Start your app
    - lt --port 3000
    - lt --port 3000 --subdomain nickfinity
- ngrok - Secure tunnel to your local machine
  - Setup:
    - Sign up
    - Install ngrok
    - Install authtoken
    - Start your app
    - ./ngrok http 80
- now - Quickly deploy node.js to the cloud
  - Setup:
    - npm install -g now
    - Create start script
    - now
- Surge- Quickly host static files to a public URL
  - Setup:
    - npm install -g surge
    - surge

### Automation

Automation can happen with Grunt, Gulp, and npm Scripts

- Grunt
  - The 'original'
  - Configuration over code
  - Writes intermediary files between steps
  - Large plugin ecosystem
- Gulp
  - Improves on Grunt's plugin model
  - Uses in-memory streams called "pipes"
  - Typically faster than Grunt
  - Code over configuration
  - Large plugin ecosystem
- npm Scripts
  - Declared in package.json
  - Leverage your OS' command line
  - Directly use npm packages
  - Call separate Node scripts
  - Convention-based pre/post hooks
  - Leverage world's largest package manager
- Why npm Scripts?
  - Use tools directly instead of through a layer of abstraction like Grunt or Gulp
  - No need for separate plugins
  - Simpler debugging
  - Better docs
  - Easy to learn
  - Simple
- npm Scripts notes
  - npm start = npm run start
  - npm test = npm run test
  - start and test are commonly used and do not require the 'run' keyword
  - Other scripts do require the run keyword
  - Using the prefix of "pre" or "post" will run before/after the script of the same name
    - Example:  "prestart" runs before "start" which runs before "poststart"

### Transpiling

Can help you convert into other languages or use newer JS while compiling to modern JS

- Babel - Modern, standards-based JS, today
  - Write standardized JS
  - Leverage full JS ecosystem
  - Use experimental features earlier
  - No type defs, annotations required
  - ES6 imports are statically analyzable
  - Test, Lint, Babel, Great libs, IDE = safety
- TypeScript - Superset of JavaScript, enhanced autocompletion, safer refactoring, clearer intent
  - Enhanced auto complete
  - Enhanced readability
  - Safer refactoring
  - Additional non-standard features
- Elm - looks nothing like JS, but compiles down to JS
  - Compiles down to JS
  - Clean syntax
  - Immutable data structures
  - Friendly errors
  - All errors are compile-time errors
  - Interops with JS
- Babel Configuration Styles
  - .babelrc
    - Not npm specific
    - Easier to read since isolated
  - package.json
    - One less file in your project
- Build Script JS Style
  - ES5
    - No waiting for transpile = faster
    - No transpiler dependency
  - Transpiled - Enjoy the latest features - Consistent coding style - Use the same linting rules everywhere - Can eventually remove transpiler

.babelrc file:

```
{
    "presets": [
        "@babel/preset-env"
    ]
}
```

### Bundling

#### Why bundle?

- CommonJS doesn't work in web browsers
- Package project into file(s)
- Improve Node performance

#### Selecting a Module Format

- IIFE (considered outdated)
  - (function() { codehere })();
- Asynchronus Module Definition (AMD) (considered outdated)
  - define(['jq'], function(jq) {});
- CommonJS
  - var jquery = require('jquery');
- Universal Module Definition (UMD) (blends AMD with CommonJS)
- ES6 Modules (preferred)
  - import jQuery from 'jquery'

#### Why Use ES6 Modules?

- Standardized
- Statically analyzable
  - Improved autocomplete
  - Intelligent refactoring
  - Fails fast
  - Tree shaking
- Easy to read
  - Named imports
  - Default exports

#### Select a Bundler

- The first popular bundler: Require.js
  - Utilizes and helped popularize AMD pattern
- Browserify
  - The first bundler to reach mass adoption
  - Bundle npm packages for the web
  - Large plugin ecosystem
- Webpack
  - Bundles more than just JS
    - CSS, HTML, Images, Fonts
  - Import CSS, images, etc like JS
  - Built in hot-reloading web server
  - Bundle splitting
  - Webpack 2 offers tree shaking
- Rollup
  - Tree shaking
  - Faster loading production code
  - Quite new
  - Great for library authors
  - No hot reloading and code splitting yet
- JSPM
  - Uses SystemJS, a universal module loader
  - Can load modules at runtime
  - Has its own package manager
  - Can install from npm, git, etc
  - Uses Rollup

#### Configuring Webpack

- Creating webpack.config.dev.js

```
import path from 'path';

export default {
    debug: true,
    devtool: 'inline-source-map',
    noInfo: false,
    entry: [
        path.resolve(__dirname, 'js/index')
    ],
    target: 'web',
    output: {
        path: path.resolve(__dirname, 'src'),
        publicPath: '/',
        filename: 'bundle.js'
    },
    plugins: [],
    module: {
        loaders: [
            {test: /\.js$/, exclude: /node_modules/, loaders: ['babel']},
            {test: /\.css$/, loaders: ['style', 'css']}
        ]
    }
}
```

- Adding import webpack and import config to srcServer.js
- Adding const compiler to srcServer.js
- Call app.use in srcServer.js
- Creating index.js
- Add script src='bundle.js' to index.html
- Add css import to index.js

#### Sourcemaps

- Useful for debugging transpiled and bundled code
- Maps code back to original source
- Part of our build
- Downloaded if you open developer tools
- Debugging demo
  - Adding debugger; to index.js

### Linting

#### Why use a linter?

- Enforce Consistency
  - Curly brace position
  - confirm / alert
  - Trailing commas
  - Globals
  - eval
- Avoid Mistakes
  - Extra parenthesis
  - Overwriting a function
  - Assignment in conditional
  - Missing default case in switch
  - debugger / console.log

#### Linters

- JSLint
  - Original
  - Very opinionated
- JSHint
- ESLint
  - Clear, best choice

#### ESLint Configuration Decisions

- 1. Config format?
  - Dedicated config file
    - Not tied to npm
  - package.json
    - One less file
- 2. Which built-in rules?
  - Best to decide as a team
- 3. Warnings or errors?
  - Warning
    - Can continue development
    - Can be ignored
    - Team must agree: fix warnings
  - Error
    - Breaks the build
    - Cannot be ignored
    - Team is forced to comply
- 4. Which plugins?
  - Enhances functionality.  You can use when using frameworks and libraries like Node, react, Angular, etc
- 5. Use preset instead?
  - You can start from scratch to build an entirely customized preset for you / your team
  - ESLint Recommended
  - Airbnb
  - Standard JS
  - XO
  - Google Styles

#### Issue: ESLint doesn't watch files.

- eslint-loader
  - Re-lints all files upon save.
- eslint-watch
  - ESLint wrapper that adds file watch
  - Not tied to webpack
  - Better warning/error formatting
  - Displays clean message
  - Easily lint tests and build scripts too

#### Issue: ESLint doesn't support many experimental JavaScript features

- Run ESLint directly
  - Supports ES6 / ES7 natively
  - Also supports object spread
- Babel-eslint
  - Also lints stages 0 - 4 features

#### Why lint via an automated build process?

- One place to check
- Universal configuration
- Part of continuous integration

#### Setting up ESLint

- Create .eslintrc.json file

```
{
    "root": true,
    "extends": [
        "eslint:recommended",
        "plugin:import/errors",
        "plugin:import/warnings"
    ],
    "parserOptions": {
        "ecmaVersion": 2019,
        "sourceType": "module"
    },
    "env": {
        "browser": true,
        "node": true,
        "mocha": true
    },
    "rules": {
        "no-console": 1
    }
}
```

- Create npm script for npm run lint
  - esw webpack.config.\* buildScripts js --color
- Create npm script for npm run lint:watch
  - npm run lint -- --watch
- Modify npm start to also run lint:watch

### Testing and Continuous Integration

#### JavaScript Testing Styles

- Unit Testing
  - Focuses on testing a single function or module in an automated fashion
  - Often asserts that a certain function returns an expected value when passed certain parameters
  - Mock out external dependencies like APIs, database calls, and file system interactions so the results are fast and deterministic
  - For testing small units of code
  - Often single function
  - Fast
  - Run upon save
- Integration Testing
  - Testing interaction between modules
  - For testing multiple units of code
  - Often involves clicking and waiting
  - Slow
  - Often run on demand, or in QA
- UI Testing
  - Automates interactions with UI

#### Decision #1: Testing Framework

- Mocha
  - Highly configurable
  - Large ecosystem of support
- Jasmine
  - Nearly as popular and similar
  - Includes an assertion library build-in
  - Less configurable than Mocha
- Tape
  - Leanest and simplist
  - Simplicity and configuration are its key strengths
- QUnit
  - Oldest
  - Created for testing jQuery by jQuery's creator, John Resin
- AVA
  - Runs tests in parallel
  - Only reruns impacted tests
- Jest
  - From Facebook
  - Popular for React developers
  - Just a nice wrapper over Jasmine, so useful for anyone
  - Code coverage, JSDOM, and popular conventions for finding your test files built in
  - Recently gotten much better

#### Decision #2: Assertion Library

- An assertion is a way to declare what you expect
  - expect(2+2).to.equal(4)
- Assertion Libraries
  - chaijs.com
  - Should.js
  - npm expect package

#### Decision #3: Helper Libraries

- JSDOM
  - Simulate's the browser's DOM
  - Run DOM-related tests without a browser
- Cheerio
  - jQuery for the server
  - Query virtual DOM using jQuery selectors

#### Decision #4: Where to Run Tests

- Browser
  - Karma, Testem
- Headless Browser (non-visible UI browser)
  - PhantomJS
- In-memory DOM
  - JSDOM

#### Decision #5: Where do test files belong?

- Centralized
  - Put all tests in a folder together (like "./tests/")
  - Less "noise" in src folder
  - Deployment confusion
  - Inertia
- Alongside
  - Easy imports
  - Clear visibility
  - Convenient to open
  - No recreating folder structure
  - Easy file moving

#### Decision #6: When should tests run?

- Unit tests should run when you hit save
  - Rapid feedback
  - Facilitates Test-Driven-Development
  - Automatic = low friction
  - Increases test visibility

#### Framework: Mocha

- Add /buildScripts/testSetup.js
- Add "test" to package.json
- Add /src/index.test.js

#### Tool Selection

- Assertion Library: Chai
- Helper Libraries: JSDOM
- Where to run tests: Node
- Where to place tests: Alongside
- When to run tests: Upon save
  - Add "test:watch" to npm scripts, add "test:watch" to "start" script

#### Why Continuous Integration?

- Continuous Integration Server catches mistakes:
  - Forgot to commit new file
  - Forgot to update package.json
  - Commit doesn't run cross-platform
  - Node version conflicts
  - Bad merge
  - Didn't run tests
  - Catches mistakes quickly
- What does a CI Server do?
  - Run automated build
  - Run your tests
  - Check code coverage
  - Automated deployment
- Continuous Integration Server options:
  - Travis (most popular)
    - Linux-based
  - Appveyor
    - Windows-based
  - Jenkins (most popular)
    - Popular, highly configurable
  - CircleCI
  - Semaphore
  - SnapCI

#### Setting up CI Servers

- For Travis CI and Appveyor
  - Set up .travis.yml file and appveyor.yml file
  - Make sure both are connected to GitHub
  - Make sure the right repo is connected
  - add, commit, push to test

### HTTP Calls

#### Overview

- Making HTTP Calls (via Node, Browser, or both)
- Mocking HTTP Calls (via Nock, hard-coded JSON, json-server/json-schema-faker, express, browsersync)
  - Why mock?
  - Mocking approaches
  - Generate mock data and mock API

#### HTTP Call Approaches

- Library options depend on where you're running your app
- Node
  - http
  - request (best choice for Node)
- Browser
  - XMLHttpRequest
  - jQuery (\$.ajax)
  - Framework-based (Angular)
  - Fetch (WHATWG) (best choice for Browser)
- Node & Browser
  - isomorphic-fetch (smaller file sizes)
  - xhr (smaller file sizes)
  - SuperAgent (more features)
  - Axios (more features)

#### Centralizing HTTP Requests

- Why centralize API calls?
  - 1 spot means 1 place to configure all calls
  - Handle preloader logic
  - Handle errors
  - Single seam for mocking

#### Setting up Fetch

- Create api functions for making the call and sending back json or error (userApi.js)
- Import getUsers from userApi into index.js and create getUsers() function to populate index.html with results
- Adjust index.test.js to test for <h1>Users</h1>
- Add sample api to srcServer.js for usersApi.js to grab
- Adjust index.html to contain table skeleton for index.js to populate if API call is successful

#### Why send a polyfill to everyone?

- It's easier and makes your site more accessible, and you can remove it once browsers all mostly have the features available natively
- You can use a service like polyfill.io to send polyfills only to browsers that need it
- Add <script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script> to your site.
- Add ?features=fetch to the end of the URL to specifically only polyfill the fetch feature
- Not entirely sure how the stuff we just did via making a mock API call with fetch wound up being a polyfill

#### Why mock HTTP?

- Benefits of mocking HTTP
  - Unit testing
  - Instant response
  - Keep working when services are down
  - Rapid prototyping
  - Avoid inter-team bottlenecks
  - Work offline
- How to Mock HTTP
  - Nock
    - You tell it the URL you're making a call to, and it will stop the call and give you a response you specified instead so you don't have to make actual API calls
  - Static JSON file
  - Create development webserver
    - api-mock
    - json-server (create fake database using static JSON via creating a real database, letting you interact with it like a real server)
    - json-schema-faker (for using dynamic data instead of hard coded data)
    - Browsersync (more realistic, more customization, but more work)
    - Express (more realistic, more customization, but more work)

#### Our Plan for Mocking HTTP

- 1. Declare our schema
  - json-schema-faker
- 2. Generate random data
  - faker.js
  - chance.js
  - randexp.js
- 3. Serve data via API
  - json-server

#### Creating a Mock API Data Schema

- Use json-schema-faker to create a mock API to make calls to.  It comes bundled with faker.js, chance.js, and randexp.js
- Use json-server to serve up the API data so it is callable

#### Using randomized data helps test:

- Edge cases
- Empty lists
- Long lists
- Long values
- Testing
- Filtering
- Sorting

#### Data generation

- Create "prestart-mockapi" npm script to generate new mock data

#### Serving up the mock data

- Add start-mockapi to npm start

### Project Structure

- The Plan
  - Your Starter Kit Needs a Demo App
  - Project Structure Tips
- Why a demo app?
  - People learn best by example.
  - Examples of:
    - Directory structure and file naming
    - Framework usage
    - Testing
    - Mock API
  - Codifies decisions
  - Interactive example of working with starter kit
- Tip 1: JS Belongs in a .js File
  - Don't put JS in HTML files!  You lose linting, reusability, transpiling, testing, importing, and more.
  - Avoid dynamically generating JS logic. Dynamically generate JSON config objects instead.
- Tip 2: Consider Organizing by Feature
  - Instead of by filetype!
  - Instead of "/components" "/data" "/models" "/views"
  - Do "/authors" "/courses" "/forums" "/dashboard"
- Tip 3: Extract Logic to POJOs
  - POJOs = Plain Old JavaScript Objects
  - Pure logic.  No framework-specific code.
  - When working in React, your logic should be as outside of react components as possible
  - Helps minimize ties to selected frameworks, minimizing impact if switching to frameworks down the road
  - Good example is react-slingshot by coryhouse on github

### Production Build

#### Minification

- How does minification work?
  - Shortens variable and function names
  - Removes comments
  - Removes whitespace and new lines
  - "Removes things coders care about while only leaving things computers need to run the code."
  - Dead code elimination / Tree-shaking
  - Debug via sourcemaps

#### Dynamic HTML

- Why manipulate HTML for production?
  - Reference bundles automatically
  - Handle dynamic bundle names
  - Inject production only resources
  - Minify
- Referencing bundled assets in HTML
  - Hard coded
    - <script src="bundle.js"></script>
  - Via Node
    - Can write a node script which copies HTML files and uses regex to manipulate sections or replace placeholders
  - html-webpack-plugin
    - Simplifies creation of your application's HTML file

#### Bundle splitting (called "chunking" in webpack)

- Why bundle splitting?
  - Speed initial page load
  - Avoid re-downloading all libraries
- Ways to bundle split
  - Split bundle by page
  - Split 3rd party libraries into separate bundle from our application code
    - If our application code changes, users won't have to download all the 3rd party libraries again

#### Cache busting

- Why cache busting?
  - Save HTTP Requests
  - You can tell the header to not re-download your .js files for up to a year
  - Speeds page loads
  - Saves bandwidth
  - Force request for latest version
- Plan for Busting Cache
  - Hash bundle filename
  - Generate HTML dynamically

#### You can extract and minify CSS separately

- Using something like mini-css-extract-plugin which will minify, sourcemap, and hash your CSS files

#### Error logging

- Services available
  - TrackJS (specific to JS)
  - Sentry (free for some usage)
  - New Relic
  - Raygun
- JS Error Logging: What to Look For
  - Error metadata
    - Browser
    - Stack trace
    - Previous actions
    - Custom API for enhanced tracking
  - Notification & integrations
  - Analytics & filtering
  - Pricing

### Production Deploy

#### Separating the UI from the API

- Why separate the UI and the API?
  - Simple, low-risk, UI only deploys
  - Separates concerns
    - Separate teams
    - Less to understand
    - Scale back-end separately
  - Cheap UI hosting
  - Serve UI via a CDN
  - Use the API tech you like

#### Automated deployment

- Cloud hosting options
  - AWS
  - Microsoft Azure
  - Heroku
  - Firebase
  - Google Cloud Platform
  - Netlify (static files only)
  - GitHub Pages (static files only)
  - Surge (static files only)
- The Path to Production
  - npm start
    - Development
  - npm run build
    - Production build
  - npm run deploy
    - Production deploy

#### Handling starter kit updates

- Your process and apps (like a starter kit!) will evolve over time.  How do you go about updating projects built upon systems (like a dev environment) that you have since updated?
- Automated Update Approaches
  - Yeoman
  - Github
  - npm

##### Option 1: Yeoman

- Handy scaffolding tool for starting new projects
- Use yeoman generator for creating new projects based on previously saved generators
- Approach:
  - Commit
  - Scaffold over the existing project
  - Resolve conflicts manually
- Check out the Yeoman Fundamentals course on Pluralsight

##### Option 2: Github

- Approach:
  - 1. Host on Github
  - 2. Fork starter kit for new projects
  - 3. Pull changes from master

##### Option 3: npm

- Approach:
  - 1. Encapsulate kit in npm package
  - 2. Update npm package to receive latest
- What can we centralize?
  - buildScripts
    - Approach: npm package
  - npm scripts in package.json
    - Approach: Call scripts in npm package
  - webpack.config files
    - Approach: npm package
  - .eslintrc
    - Create preset
- What would be decentralized?
  - .editorconfig
  - .babelrc
  - CI config (.travis.yml appveyor.yml)
  - Package references in package.json

#### Inspiration

- andrewfarmer.com/starter-project/
- github.com/gianarb/awesome-angularjs
- Search!
  - Type your favorite framework into Google plus...
    - Development environment
    - Boilerplate
    - Starter kit
    - Starter project
    - Seed

#### Challenge

- Schedule a meeting with your team to start deciding on your starter kit.
