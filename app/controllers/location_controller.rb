class LocationController < ApplicationController

  post "/locations/view_forums" do
    user_input = params[:user_input].split.map(&:downcase).join(' ')

    Cities.data_path = 'cities'
    c = Cities.cities_in_country('US')

    if c.has_key?(user_input) || user_input == "staten island"
<<<<<<< HEAD
=======

>>>>>>> 570959a0956063e7c370c79ad211cef8df15fba8
      @location = Location.find_or_create_by(city: params[:user_input].split.map(&:capitalize).join(' '))

      erb :'/locations/forums'
    else

      flash[:message] = "That city doesn't exist. What do you think this is? Disney Land?"
      redirect '/users/home'
    end
  end






















end
