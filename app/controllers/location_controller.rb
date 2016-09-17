class LocationController < ApplicationController


  post "/locations/view_forums" do

    @location = Location.find_or_create_by(city: params[:user_input])
    erb :'/locations/forums'
  end

























end
