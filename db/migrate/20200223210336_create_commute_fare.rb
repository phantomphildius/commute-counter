class CreateCommuteFare < ActiveRecord::Migration[6.0]
  def change
    create_table :commute_fares, id: :uuid do |t|
      t.references :user, foreign_key: true, index: true, type: :uuid
      t.integer :cost_cents
    end
  end
end
