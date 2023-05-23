class AddEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_app_slack_id, :string
  end
end
