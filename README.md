wikipedia-tests
===============
These are few test scenarios for **Wikipedia** which I have created to learn cucumber and ruby. The features can be run in prallel in multiple browsers on the [BrowserStack Automate](http://www.browserstack.com/automate)  

Pre-requisites:
  1. `ruby 1.9.3` 
  2. bundler - `gem install bundler`

Steps to execute the scenarios:
  1. Clone the repo
  2. run `bundle install`
  3. Specify the browsers in `browsers.json`
  4. To run the features in parallel in two browsers, execute `rake cucumber nodes=2`

TODO:
  1. Improve page objects
  2. webdriver hepler methods
