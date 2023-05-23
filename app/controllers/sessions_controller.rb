class SessionsController < Devise::SessionsController

  # https://stackoverflow.com/questions/13836139/rails-how-to-override-devise-sessionscontroller-to-perform-specific-tasks-when
  # def new
  #   super
  # end

  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message(:notice, :signed_in) if is_navigational_format?
  #   sign_in(resource_name, resource)
  #   if !session[:return_to].blank?
  #     redirect_to session[:return_to]
  #     session[:return_to] = nil
  #   else
  #     respond_with resource, :location => after_sign_in_path_for(resource)
  #   end
  # end

  def slack
    auth_hash = request.env['omniauth.auth']
    token = auth_hash.credentials.token
    response = Faraday.get('https://slack.com/api/auth.test?pretty=1', nil, { Authorization: "Bearer #{token}"})
    # response.body
    result = JSON.parse(response.body)
    user_id = result["user_id"]
    user = User.find_by(user_app_slack_id: user_id)
    render json: user.to_json
  end
end
