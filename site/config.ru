#!/usr/bin/env ruby

($: << ['./app/ruby', './lib', './config', './db']).flatten!
#require 'ruby-prof'

require 'rubygems'
require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'
Bundler.require :default, ENV['RACK_ENV']

use Rake::Pipeline::Middleware, 'Assetfile'

use Rack::Reloader, 1

if ENV['RACK_PROFILE'] == "true"
  use Rack::RubyProf, path: File.dirname(__FILE__)+"/profile"
end

use Rack::Static, urls: ['/qunit.html', '/javascript', '/stylesheet', '/images'], root: 'public'

run ->(env){[200, {"Content-Type" => "text/html"}, [File.read(File.join('public', 'index.html'))]]}
