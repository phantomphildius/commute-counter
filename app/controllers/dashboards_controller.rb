class DashboardsController < ApplicationController
  def index
    @savings_calculator = SavingsCalculators::CommuteCost.new(current_user)
    @user = current_user
  end
end
