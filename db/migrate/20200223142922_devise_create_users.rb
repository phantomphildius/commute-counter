# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, default: ""

      t.string :name, null: false, default: ""

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## OmniAuth
      t.string :provider
      t.string :uid
      t.string :strava_oauth_token

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :uid, unique: true
  end
end
