class SessionsController < ApplicationController
  helper_method :logged_in?

  def create
    if params[:password] == "SuperSecret" # SHA1 it or whatever
      session[:logged_in] = true

      redirect_to session_path, :notice => 'just logged in'
    else
      redirect_to session_path, :alert => 'not really'
    end
  end

  def destroy
    session.delete :logged_in
    redirect_to session_path, :notice => 'logged out'
  end

  private

  def logged_in?
    session[:logged_in]
  end
end
