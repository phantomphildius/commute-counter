class CreateCommuteActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :commute_activities, id: :uuid do |t|
      t.bigint :remote_id
      t.string :name
      t.float :distance_miles
      t.bigint :time_elapsed_seconds
      t.timestamp :activity_date

      t.decimal :start_lat
      t.decimal :start_lng
      t.decimal :end_lat
      t.decimal :end_lng

      t.references :user, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
