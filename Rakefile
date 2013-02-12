# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rubygems'
require 'bundler/setup'
require 'cucumber'
require 'cucumber/rake/task'
require 'rake'
require File.expand_path('../config/application', __FILE__)

desc 'Default: run specs and features.'
task :default => ["db:test:prepare", "db:seed", :spec, :cucumber]

Mweb3::Application.load_tasks

# conditional load so it doesn't fail when in production
begin
  require 'rspec/core/rake_task'
rescue LoadError
end
