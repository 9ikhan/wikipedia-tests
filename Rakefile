# -*- coding: utf-8 -*-
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'json'

@browsers = JSON.load(open('browsers.json'))
@parallel_limit = ENV["nodes"] || 1
@parallel_limit = @parallel_limit.to_i

task :cucumber do
  current_browser = ""
  begin
    Parallel.map(@browsers, :in_threads => @parallel_limit) do |browser|
        current_browser = browser
        puts "Running with browser : #{browser.inspect}"
        ENV['BROWSER'] = browser['browser']
        ENV['BROWSER_VERSION'] = browser['browser_version']
        ENV['OS'] = browser['os']
        ENV['OS_VERSION'] = browser['os_version']
        system("bundle exec parallel_cucumber features/")
    end
  rescue SystemExit, Interrupt
    puts "User stopped script!"
    puts "Failed to run tests for #{current_browser.inspect}"
  end
end

task :default => [:cucumber]
