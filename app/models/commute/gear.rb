class Commute::Gear < ApplicationRecord
  self.table_name = 'commute_gears'

  monetize :price_cents

  belongs_to :user
end
