class LocationController < ApplicationController


  get "/view_forums" do
    @locations = Location.find_or_create_by(params[:user_input])
    erb :'/locations/forums'
  end























end
