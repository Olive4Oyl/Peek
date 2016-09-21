require 'socket'
require 'json'
require 'open-uri'
<<<<<<< HEAD
=======
require 'rack-flash'
require 'nokogiri'
require 'httpclient'
# require 'giphy'
>>>>>>> 0073d7ee7778b5f4a1d680f2bc54b61ed714659b

class ApplicationController < Sinatra::Base

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