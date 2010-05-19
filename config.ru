require 'rubygems'
require 'sinatra/lib/sinatra.rb'

root_dir = File.dirname(__FILE__)

set :environment, ENV['RACK_ENV'].to_sym
set :root,        root_dir
set :app_file,    File.join(root_dir, './app/haml-test.rb')
disable :run, :reload
require './app/haml-test.rb'
run Sinatra::Application
