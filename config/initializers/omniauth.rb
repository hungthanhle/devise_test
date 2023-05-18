Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_APP_ID'], ENV['SLACK_APP_SECRET'], scope: 'team:read,users:read,identify,bot'
end
