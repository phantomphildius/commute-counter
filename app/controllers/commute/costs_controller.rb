class Commute::CostsController < ApplicationController
  def index
    @costs = current_user.commute_gears
  end
end
