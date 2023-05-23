# require 'uri'
# require 'net/http'

class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def help
  end

  private
    def authenticate_user!
      redirect_to '/auth/login' unless current_user
    end
end
