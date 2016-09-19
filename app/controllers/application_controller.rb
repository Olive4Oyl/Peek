require 'socket'
require 'json'
require 'open-uri'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  register Sinatra::ActiveRecordExtension

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end

  helpers do

    def logged_in?
      !!session[:id]
    end

    def current_user
       User.find_by(id: session[:id])

    end




  end
