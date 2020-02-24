class SavingsCalculators::CommuteCost
  MTA_FARE_COST = 2.75

  def initialize(user)
    @user = user
  end

  def savings
    user_gear_cost + (user_commutes_count * fare_cost)
  end

  private

  attr_reader :user

  def fare_cost
    user.commute_fare.cost
  end

  def user_commutes_count
    user.activities.select(&:commute).count
  end

  def user_gear_cost
    user.commute_gears.sum(&:price) * -1
  end
end
