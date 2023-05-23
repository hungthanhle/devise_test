Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :slack, ENV['SLACK_APP_ID'], ENV['SLACK_APP_SECRET'], name: :sign_in_with_slack, scope: 'identity.basic'
  provider :slack, ENV['SLACK_APP_ID'], ENV['SLACK_APP_SECRET'], scope: 'team:read,users:read,identify,bot'
  # provider :slack, ENV['SLACK_APP_ID'], ENV['SLACK_APP_SECRET'], :user_scope => 'users:read,identify,bot'
end
