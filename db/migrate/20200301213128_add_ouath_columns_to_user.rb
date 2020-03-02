class AddOuathColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :strava_refresh_token, :string
    add_column :users, :expires_at, :timestamp
  end
end
