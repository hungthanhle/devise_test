class UsersController < ApplicationController

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      @user = {"email": "not found"}
    end
    if current_user.can? :edit, @user
      render json: {email: @user[:email]}
    else
      render html: "not permission"
    end
  end

  def index
  end
end
