ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

load 'tasks/emoji.rake'

task :console do
  Pry.start
end
