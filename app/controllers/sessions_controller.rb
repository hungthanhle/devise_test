class SessionsController < Devise::SessionsController
  # https://github.com/heartcombo/devise/blob/main/app/controllers/devise/sessions_controller.rb
  def slack
    # auth_hash = request.env['omniauth.auth']
    # token = auth_hash.credentials.token
    # response = Faraday.get('https://slack.com/api/auth.test?pretty=1', nil, { Authorization: "Bearer #{token}"})
    # # response.body
    # result = JSON.parse(response.body)
    # user_id = result["user_id"]
    # user = User.find_by(user_app_slack_id: user_id)

    # # create({"user" => user}) #fail
    # # resource = user #fail

    # # self.resource = warden.authenticate!(auth_options)
    # self.resource = user
    # set_flash_message!(:notice, :signed_in)
    # # debugger
    # sign_in(resource_name, resource)
    # if !session[:return_to].blank?
    #   redirect_to session[:return_to]
    #   session[:return_to] = nil
    # else
    #   redirect_to root_path
    # end
  end
end
