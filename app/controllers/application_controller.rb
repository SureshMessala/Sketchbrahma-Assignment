class ApplicationController < ActionController::Base

  # rescue_from ActionController::RoutingError, :with => :my_error

  private

  def my_error
    redirect_to root_path, alert: "my Error"
  end
end
