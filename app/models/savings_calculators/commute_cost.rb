class SavingsCalculators::CommuteCost
  def initialize(user)
    @user = user
  end

  def savings
    user_commutes_count * fare_cost
  end

  private

  attr_reader :user

  def fare_cost
    user.commute_fare.cost
  end

  def user_commutes_count
    user.activities.count
  end
end
