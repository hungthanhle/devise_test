class CreateSlackApps < ActiveRecord::Migration[6.1]
  def change
    create_table :slack_apps do |t|
      t.string :app_name
      t.string :app_id
      t.text :access_token
      t.text :refresh_token
      t.text :incoming_webhook

      t.timestamps
    end
  end
end
