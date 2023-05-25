class SessionsController < Devise::SessionsController
  # https://github.com/heartcombo/devise/blob/main/app/controllers/devise/sessions_controller.rb
  def slack
    # debugger
    # auth_hash = request.env['omniauth.auth'] <- định vọc biến request
    # token = auth_hash.credentials.token

    # body = '{"client_id": ' + "#{ENV['SLACK_CLIENT_DEF_ID']} ," + '"client_secret":' + "#{ENV['SLACK_CLIENT_DEF_SECRET']}," + '"code":' + "#{params[:code]}" + '}' <- this is string
    # body = {
    #   client_id: ENV['SLACK_CLIENT_DEF_ID'],
    #   client_secret: ENV['SLACK_CLIENT_DEF_SECRET'],
    #   code: params[:code]
    # }
    # body = body.to_json
    # response = Faraday.post('https://slack.com/api/oauth.v2.access', body, "Content-Type" => "application/json; charset=utf-8")
    
    # response = Faraday.get("https://slack.com/api/oauth.v2.exchange?client_id=#{ENV['SLACK_CLIENT_DEF_ID']}&client_secret=#{ENV['SLACK_CLIENT_DEF_SECRET']}&token=#{ENV['SLACK_API_DEF_TOKEN']}")
    response = Faraday.get("https://slack.com/api/oauth.v2.access?client_id=#{ENV['SLACK_CLIENT_DEF_ID']}&client_secret=#{ENV['SLACK_CLIENT_DEF_SECRET']}&code=#{params[:code]}")
    
    result = JSON.parse(response.body)
    # ok = result["ok"]

    # debugger
    incoming_webhook = result["incoming_webhook"]["url"]
    render json: {slack: result.to_s, incoming_webhook: incoming_webhook}
  end
end
