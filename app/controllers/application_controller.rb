class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_admin
    if cookies[:admin]
      cookies.delete(:admin)
    else
      cookies[:admin] = true
    end
    redirect_to draft_path
  end
end
