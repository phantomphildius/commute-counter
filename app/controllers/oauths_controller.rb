class OauthsController < ApplicationController
  def index
    client = Strava::OAuth::Client.new(
      client_id: Rails.application.credentials.strava.fetch(:client_id),
      client_secret: Rails.application.credentials.strava.fetch(:secret)
    )

    response = client.oauth_token(code: params.fetch(:code))

    api_client = Strava::Api::Client.new(
      access_token: response.access_token
    )

    @activities = api_client.athlete_activities.select(&:commute)
  end
end
