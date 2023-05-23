# require 'uri'
# require 'net/http'

class StaticPagesController < ApplicationController
  # before_action :authenticate_user!

  def home
  end

  def help
  end

  def slack
    auth_hash = request.env['omniauth.auth']
    # auth_hash.credentials.token
    # auth_hash.extra.user_info # me?? <- nil
    # auth_hash.info
    # auth_hash.extra.bot_info.bot_user_id #bot

    # - work but need header
    # token = "Bearer " + auth_hash.credentials.token
    # uri = URI('https://jsonplaceholder.typicode.com/todos/1')
    # res = Net::HTTP.get_response(uri)
    # result = res.body if res.is_a?(Net::HTTPSuccess)

    # - not work net-http
    # uri = URI.parse("https://jsonplaceholder.typicode.com/todos/1")
    # http = Net::HTTP.new(uri.host, uri.port)
    # request = Net::HTTP::Get.new(uri.request_uri)
    # request["User-Agent"] = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36"
    # request["Accept"] = "*/*"
    # response = http.request(request)

    token = auth_hash.credentials.token
    # conn = Faraday.new(url: 'https://jsonplaceholder.typicode.com/todos/1')
    response = Faraday.get('https://slack.com/api/auth.test?pretty=1', nil, { Authorization: "Bearer #{token}"})
    # response.body
    result = JSON.parse(response.body)
    user_id = result["user_id"]
    render html: user_id
  end

  private
    def authenticate_user!
      redirect_to '/auth/login' unless current_user
    end
end
