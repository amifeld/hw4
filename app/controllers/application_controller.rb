class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    # puts "------------------ code before every request ------------------"
    @current_user = User.find_by({ "id" => session["user_id"] })
    @user = User.all
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end

  
end
