class CreateCommuteFare < ActiveRecord::Migration[6.0]
  def change
    create_table :commute_fares do |t|
      t.references :user, foreign_key: true, index: true, type: :uuid
      t.bigint :cost_cents
    end
  end
end
