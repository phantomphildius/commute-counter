class Commute::SavingsController < ApplicationController
  def index
    @savings_calculator = SavingsCalculators::CommuteCost.new(current_user)
  end
end
