class ApplicationController < ActionController::Base

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      # change to static-about page
      redirect_to(root_path)
    end
  end
end
