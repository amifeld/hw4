class PlacesController < ApplicationController

  def index
    @places = Place.all
    @user = User.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place["id"] = Place.where({ "user_id" => @user["id"]})
    @place.save
    redirect_to "/places"
  end

end
