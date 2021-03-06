class HomeController < ApplicationController
  
  def index
    if user_signed_in?
      @projects = current_user.projects
    else
      redirect_to new_user_session_path
    end
  end
end
