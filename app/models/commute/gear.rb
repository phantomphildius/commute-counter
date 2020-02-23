class Commute::Gear < ApplicationRecord
  self.table_name = 'commute_gears'

  monetize :cost_cents

  belongs_to :user
end
