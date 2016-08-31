# Introduction
Docker image to easily run Karma tests using [Karma](https://karma-runner.github.io/1.0/index.html) and [PhantomJS](http://phantomjs.org/)

![Karma](https://karma-runner.github.io/assets/img/banner.png)

# Getting started

## Requirements
- [Docker](https://docs.docker.com/engine/installation/)

## Usage
To use this image to run your app tests use the following command in your project

```
docker run --rm -ti -v "$PWD":/app huli/karma npm test
```

## Configuration
This image comes with the following packages preinstalled:
- [Mocha](https://mochajs.org/)
- [Chai](http://chaijs.com/)
- [Sinon](http://sinonjs.org/)
- [Jasmine](http://jasmine.github.io/)
- [RequireJS](http://requirejs.org/)
- [Babel Polyfill](https://babeljs.io/docs/usage/polyfill/)
- [Bower](https://bower.io/)

If you are using promises in your tests, make sure to add the polyfill file to your karma.conf.js file:
```
files: [
  '/install/node_modules/babel-polyfill/dist/polyfill.js'
]
```
