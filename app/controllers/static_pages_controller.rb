class StaticPagesController < ApplicationController
  # before_action :authenticate_user!

  def home
  end

  def help
  end

  def slack
    auth_hash = request.env['omniauth.auth']
    # auth_hash.credentials.token
    # auth_hash.extra.user_info # me??
    # auth_hash.info
    # auth_hash.extra.bot_info.bot_user_id #bot
    debugger
    render html: auth_hash.info.email
  end

  private
    def authenticate_user!
      redirect_to '/auth/login' unless current_user
    end
end
