class Commute::Fare < ApplicationRecord
  self.table_name = 'commute_fares'

  monetize :cost_cents

  belongs_to :user
end
