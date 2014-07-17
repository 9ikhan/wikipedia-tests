require "selenium-webdriver"
require  File.join(File.dirname(__FILE__), '..', '..', 'lib', 'driver_helper')
 
if ENV['REMOTE'] == "true" 

  url = "http://#{ENV['HUB_USERNAME']}:#{ENV['AUTH_KEY']}@#{ENV['HUB_NAME']}.browserstack.com:#{ENV['HUB_PORT']}/wd/hub"
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  capabilities['os'] = ENV['OS']
  capabilities['os_version'] = ENV['OS_VERSION']
  capabilities['browser'] = ENV['BROWSER']
  capabilities['browser_version'] = ENV['BROWSER_VERSION']
  capabilities['build'] = ENV['BUILD'] || "Testing Parallel"
  capabilities['browserstack.debug'] = 'true'

  browser = Selenium::WebDriver.for(:remote, :url => url,
                                  :desired_capabilities => capabilities)

elsif ENV['LOCAL'] == "true"
  browser = Selenium::WebDriver.for :chrome 

elsif ENV['HEADLESS'] = "true"
  require 'headless'
  headless = Headless.new
  headless.start
  
  at_exit do
    headless.destroy
  end

end


Before do |scenario|
  browser.manage.window.maximize
  browser.manage.timeouts.page_load = 60
  @browser = browser
end

After do |scenario|

end

at_exit do
  browser.quit
end


