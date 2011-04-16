class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Go away or I shall taunt you a second time."
    redirect_to root_url
  end
end
