class PlacesController < ApplicationController

  def index
    @places = Place.all
    @user = User.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"], "user_id" => @current_user["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
