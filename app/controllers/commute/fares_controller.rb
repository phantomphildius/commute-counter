class Commute::FaresController < ApplicationController
  def new
    @commute_fare = Commute::Fare.new
  end

  def create
    @commute_fare = Commute::Fare.new(fare_params)
    if @commute_fare.save!
      flash[:success] = "Object successfully created"
      redirect_to dashboards_path
    else
      flash[:error] = "Something went wrong"
    end
  end

  private

  def fare_params
    params.require(:commute_fare).permit(:cost).merge(user: current_user)
  end
end
