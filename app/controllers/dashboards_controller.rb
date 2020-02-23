class DashboardsController < ApplicationController
  def index
    api_client = Strava::Api::Client.new(
      access_token: current_user.strava_oauth_token
    )

    @activities = api_client.athlete_activities.select(&:commute)
  end
end
