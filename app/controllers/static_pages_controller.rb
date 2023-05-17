class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  # authorize_resource :class => :controller

  def home
  end

  def help
  end

  def admin
    authorize! :admin, current_user
  end

  private
    def authenticate_user!
      redirect_to '/auth/login' unless current_user
    end
end
