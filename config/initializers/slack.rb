Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

# rails c
# client = Slack::Web::Client.new
# client.auth_test <- me or bot <- 2 type (user and bot token) of SLACK_API_TOKEN
# client.chat_postMessage(channel: '#general', text: 'https://api.slack.com/methods/auth.test/test', as_user: true)
# client.users_info(user: 'U05854MSNLT').user.name #me
# client.users_info(user: '@hunglt.ee').user.id #me
