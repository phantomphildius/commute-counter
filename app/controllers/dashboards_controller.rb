class DashboardsController < ApplicationController
  before_action :ensure_user_has_a_commute_fare

  def index
    @savings_calculator = SavingsCalculators::CommuteCost.new(current_user)
    @activities = current_user.activities.select(&:commute)
    @time_cost = SavingsCalculators::TimeCost.new(@activities.first).savings
  end

  private

  def ensure_user_has_a_commute_fare
    redirect_to new_commute_fare_path unless current_user.commute_fare.present?
  end
end
