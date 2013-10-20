class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_session
  helper_method :current_user

  def set_session
    if session[:user_id].nil? || @current_user.nil?
      user = User.create
      session[:user_id] = user.id.to_s
    end
  end

  def current_user
    unless @current_user || !@current_user.nil?
      @current_user = User.where(id: session[:user_id]).first
    end
    @current_user
  end
end