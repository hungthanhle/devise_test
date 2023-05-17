class UsersController < ApplicationController

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      @user = {"email": "not found"}
    end
  end

  def index
  end
end
