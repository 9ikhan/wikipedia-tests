require 'allure-cucumber'
require "selenium-webdriver"

require  File.join(File.dirname(__FILE__), '..', '..', 'lib', 'driver_helper')
 
#include AllureCucumber::DSL

def session_name(scenario)
  case scenario
    when Cucumber::Ast::Scenario
      scenario_name = scenario.name
    when Cucumber::Ast::OutlineTable::ExampleRow
      scenario_name = "#{scenario.scenario_outline.name} - #{scenario.name}"
  end
  scenario_name
end


Before do |scenario|
  #loading the config yaml
  configuration = YAML.load(File.read("#{File.dirname(__FILE__)}/browsers.yml"))
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  capabilities = configuration[ENV["CURRENT_BROWSER"]]
  capabilities["build"] = "#{ENV['CURRENT_BROWSER']}_#{ENV['EXECUTION_TYPE']}_#{ENV['NUMBER'] || 1}".upcase
  capabilities["name"] = session_name(scenario)
  browser = Selenium::WebDriver.for(:remote, :url => capabilities["hub_url"],
                                  :desired_capabilities => capabilities)
  browser.manage.window.maximize
  #browser.manage.timeouts.page_load = 60
  @browser = browser
end

After do |scenario|
   #@browser.save_screenshot('screen.png')
   #attach_file('screenshot', File.open("screen.png"))
   @browser.quit
end

at_exit do
  #browser.quit
  puts "done"
end


