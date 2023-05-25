class SessionsController < Devise::SessionsController
  # https://github.com/heartcombo/devise/blob/main/app/controllers/devise/sessions_controller.rb
  def slack
    response = Faraday.get("https://slack.com/api/oauth.v2.access?client_id=#{ENV['SLACK_CLIENT_DEF_ID']}&client_secret=#{ENV['SLACK_CLIENT_DEF_SECRET']}&code=#{params[:code]}")
    # -> authed_user (hunglt.ee) show info id <- no use me-token
    result = JSON.parse(response.body)
    # result["expires_in"]
    incoming_webhook = result["incoming_webhook"]["url"] # EXPIRE OR NOT ??? <- webhooks only show once when slick install
    render json: {slack: result.to_s, incoming_webhook: incoming_webhook} #
    # think redirect
  end
end
