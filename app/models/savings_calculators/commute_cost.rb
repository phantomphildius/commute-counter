class SavingsCalculators::CommuteCost
  MTA_FARE_COST = 2.75

  def initialize(user)
    @user = user
  end

  def savings
    (user_gear_cost + (user_commutes.count * fare_cost)).to_money
  end

  private

  attr_reader :user

  def fare_cost
    user.commute_fare.cost_cents
  end

  def user_commutes
    user.activities.select(&:commute)
  end

  def user_gear_cost
    user.commute_gears.sum(&:cost_cents) * -1
  end
end
