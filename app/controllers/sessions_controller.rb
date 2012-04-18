class SessionsController < ApplicationController
  helper_method :logged_in?

  def create
    session[:logged_in] = true
    redirect_to session_path
  end

  def destroy
    session.delete :logged_in
    redirect_to session_path
  end

  private

  def logged_in?
    session[:logged_in]
  end
end
