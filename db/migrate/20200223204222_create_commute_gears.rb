class CreateCommuteGears < ActiveRecord::Migration[6.0]
  def change
    create_table :commute_gears, id: :uuid do |t|
      t.references :user, foreign_key: true, index: true, type: :uuid
      t.string :name
      t.integer :price_cents

      t.timestamps
    end
  end
end
