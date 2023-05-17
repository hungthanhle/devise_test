class UsersController < ApplicationController

  def edit
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
  end

  def destroy
    @user = User.find_by(id: params[:id])
    # debugger
    if can? :destroy, @user
      render html: "CAN DESTROY"
    else
      render html: "You don't have permission"
    end
  end
end
