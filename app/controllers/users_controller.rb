class UsersController < ApplicationController

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      @user = {"email": "not found"}
    end
    render json: {email: @user[:email]}
  end

  def index
  end
end
