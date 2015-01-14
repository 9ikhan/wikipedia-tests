require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'

namespace :features do 

  @tasks_to_run = ['features:win_chrome','features:win_firefox']
  @default_execution_type = 'sanity'
  @parallel_limit = 2
  @tags_to_ignore = ['wip', 'no_run', 'test']

  task :all_browsers, :execution_type  do |_,args| 
    begin
    Parallel.map(@tasks_to_run, :in_processes => @parallel_limit) do |task|
      ENV['EXECUTION_TYPE'] = args[:execution_type]
      Rake::Task[task].execute()
    end 
    rescue Exception => e
      puts "Exception in running the task - #{e.to_s}"
    end
  end

  task :win_chrome do |t|
    cukes('win_chrome', ['chrome'])
  end

  task :win_firefox do |t|
    cukes('win_firefox', ['firefox'])
  end

  def cukes(browser, tags)
    execution_type = ENV['EXECUTION_TYPE'] || @default_execution_type
    tags  = tags << execution_type
    execution_tags = tags.collect{ |item| "--tags @#{item}"}.join(" ")
    ignore_tags = @tags_to_ignore.collect{ |item| "--tags ~@#{item}"}.join(" ")
    str_tags = "#{execution_tags} #{ignore_tags}"
    Cucumber::Rake::Task.new(:features) do |t|
      ENV["CURRENT_BROWSER"] = browser
      t.cucumber_opts = "-r features #{str_tags} --format pretty --format html -o reports/#{browser}_#{ENV['EXECUTION_TYPE']}_test_report.html"
    end
    Rake::Task[:features].invoke 
  end

end
