class AddChannelNameAndChannelIdToSlackApp < ActiveRecord::Migration[6.1]
  def change
    add_column :slack_apps, :channel_name, :string
    add_column :slack_apps, :channel_id, :string
  end
end
