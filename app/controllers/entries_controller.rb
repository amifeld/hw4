class EntriesController < ApplicationController
  
  def index
    @entry = Entry.all

    # alternative responses to requests other than HTML
    respond_to do |format|
      format.html # implicitly renders posts/index.html.erb
      format.json do
        render :json => @entry
      end
    end
  end

  def new
    @entry = Entry.new
  end

  def create
    
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    if params.dig("entry", "uploaded_image").present?
      @entry.uploaded_image.attach(params["entry"]["uploaded_image"])
    end
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = @current_user["id"]
    @entry.save
    
    redirect_to "/places/#{@entry["place_id"]}"
    
  end



  before_action :allow_cors
  def allow_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
    response.headers['Access-Control-Max-Age'] = '1728000'
  end

end