class LocationController < ApplicationController


  post "/locations/view_forums" do

    @location = Location.find_or_create_by(city: params[:user_input].split.map(&:capitalize).join(' '))
    erb :'/locations/forums'
  end

























end
