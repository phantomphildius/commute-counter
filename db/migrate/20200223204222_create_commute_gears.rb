class CreateCommuteGears < ActiveRecord::Migration[6.0]
  def change
    create_table :commute_gears do |t|
      t.references :user, foreign_key: true, index: true, type: :uuid
      t.string :name
      t.bigint :cost_cents

      t.timestamps
    end
  end
end
