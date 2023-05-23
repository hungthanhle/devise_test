Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

# rails c
# client = Slack::Web::Client.new
# client.auth_test
# client.chat_postMessage(channel: '#general', text: 'https://api.slack.com/methods/auth.test/test', as_user: true)
