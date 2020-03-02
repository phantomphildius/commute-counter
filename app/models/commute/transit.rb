class Commute::Transit < ApplicationRecord
  self.table_name = 'commute_transits'

  belongs_to :activity, foreign_key: 'commute_activity_id'
end
