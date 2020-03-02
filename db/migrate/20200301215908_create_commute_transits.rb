class CreateCommuteTransits < ActiveRecord::Migration[6.0]
  def change
    create_table :commute_transits, id: :uuid do |t|
      t.bigint :time_elapsed_seconds
      t.references :commute_activity, index: { unique: true }, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
