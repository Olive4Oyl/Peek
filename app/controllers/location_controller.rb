require 'rack-flash'

class LocationController < ApplicationController
 use Rack::Flash

  post "/locations/view_forums" do
    user_input = params[:user_input].split.map(&:downcase).join(' ')

    Cities.data_path = 'cities'
    c = Cities.cities_in_country('US')

    if c.has_key?(user_input) || user_input == "staten island"
      @location = Location.find_or_create_by(city: params[:user_input].split.map(&:capitalize).join(' '))
      erb :'/locations/forums'
    else

      flash.now[:message] = "That city doesn't exist. What do you think this is? Disney Land?"
      redirect '/users/home'
    end
  end






















end
