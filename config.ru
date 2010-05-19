require 'rubygems'
require 'sinatra/lib/sinatra.rb'

root_dir = File.dirname(__FILE__)

set :environment, ENV['RACK_ENV'].to_sym
set :root,        root_dir
set :app_file,    File.join(root_dir, 'index.rb')
disable :run, :reload
require 'index.rb'
log = File.new("sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)
run Sinatra::Application
