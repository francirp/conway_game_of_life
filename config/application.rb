# BUNDLER
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

load_paths = %W(app/classes)

load_paths.each do |path|
  Dir[File.dirname(__FILE__) + "/../#{path}/*.rb"].each do |file|
    require file
  end
end