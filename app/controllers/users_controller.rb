class UsersController < ApplicationController

  # GET /products/1.json
  def show
    if params[:id] == 'current'
      @user = current_user
    else
      @user = User.where(id: params[:id]).first
    end
    respond_to do |format|
      format.json { render action: 'show'}
    end
  end

end