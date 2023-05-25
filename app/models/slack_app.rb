class SlackApp < ApplicationRecord
  def verify_access_token
    # app = SlackApp.find_by(app_id: A059L2286NM, channel_name:)
    # access_token = app.access_token #<- DATABASE OR CLIENT HOLD
    response = Faraday.get("https://slack.com/api/auth.test", nil, { Authorization: "Bearer #{access_token}"})
    result = JSON.parse(response.body)
    if result["ok"]
      true
    else
      false
    end
  end

  def new_tokens
    # app = SlackApp.find_by(app_id: A059L2286NM, , channel_name:)
    # refresh_token = app.refresh_token #<- DATABASE OR CLIENT HOLD
    if refresh_token.nil?
      return false
    end
    response = Faraday.get("https://slack.com/api/oauth.v2.access?client_id=#{ENV['SLACK_CLIENT_DEF_ID']}&client_secret=#{ENV['SLACK_CLIENT_DEF_SECRET']}&grant_type=refresh_token&refresh_token=#{refresh_token}")
    result = JSON.parse(response.body)
    app_id = result["app_id"]
    access_token = result["access_token"]
    refresh_token = result["refresh_token"]
    # app.update_attributes
    update_attribute(:access_token, access_token)
    update_attribute(:refresh_token, refresh_token)
  end
end
