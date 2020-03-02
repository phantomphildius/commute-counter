class SavingsCalculators::TimeCost
  def initialize(activity)
    @activity = activity
  end

  def savings
    ((transit_time - activity.elapsed_time).to_f / 60).ceil
  end

  private

  attr_reader :activity

  def transit_time
    Commute::TransitTime.new(activity).calculate
  end
end
