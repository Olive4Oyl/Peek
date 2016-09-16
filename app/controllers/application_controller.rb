require 'socket'
require 'json'
require 'open-uri'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
<<<<<<< HEAD
    location = {}
    output = JSON.parse(open('http://ipinfo.io').read)
    location[:city] = output["city"].to_s
    location[:zipcode] = output["postal"].to_s
    location.to_s
=======
>>>>>>> 20fb723a758e011b5fb966f5a2eab0492f545501
    erb :index
  end
end
