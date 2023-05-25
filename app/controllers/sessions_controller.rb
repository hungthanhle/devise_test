class SessionsController < Devise::SessionsController
  def slack
    response = Faraday.get("https://slack.com/api/oauth.v2.access?client_id=#{ENV['SLACK_CLIENT_DEF_ID']}&client_secret=#{ENV['SLACK_CLIENT_DEF_SECRET']}&code=#{params[:code]}")
    result = JSON.parse(response.body)
    incoming_webhook = result["incoming_webhook"]["url"]
    channel_name = result["incoming_webhook"]["channel"]
    channel_id = result["incoming_webhook"]["channel_id"]
    app_id = result["app_id"]
    access_token = result["access_token"]
    refresh_token = result["refresh_token"]
    # create_or_update
    app = SlackApp.where(app_id: app_id, channel_name: channel_name).first_or_initialize
    app.incoming_webhook = incoming_webhook
    app.access_token = access_token
    app.refresh_token = refresh_token
    app.channel_name = channel_name
    app.channel_id = channel_id
    app.save

    render json: {slack: result.to_s, incoming_webhook: incoming_webhook, access_token: access_token, refresh_token: refresh_token}
    # render json: {incoming_webhook: incoming_webhook, access_token: access_token, refresh_token: refresh_token}
  end

  # def verify_access_token
    
  # end

  # def create_new_tokens
    
  # end

  def some_auth_logic
    app = SlackApp.find_by(app_id: "A059L2286NM", channel_name: "#general")
    if !app.verify_access_token
      app.create_new_tokens
    end
    puts "let's use webhooks for message to channel"
    puts "let's use access_token for message to user or check user_info"
    # rails c
    # puts app.verify_access_token

    # app.create_new_tokens
    # puts app.verify_access_token
  end
end
