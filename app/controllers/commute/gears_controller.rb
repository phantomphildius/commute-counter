class Commute::GearsController < ApplicationController
  def new
    @commute_fare = Commute::Gear.new
  end

  def create
    @commute_fare = Commute::Gear.new(gear_params)
    if @commute_fare.save!
      flash[:success] = "Object successfully created"
      redirect_to dashboards_path
    else
      flash[:error] = "Something went wrong"
    end
  end

  private

  def gear_params
    params.permit(:price, :name).merge(user: current_user)
  end
end
