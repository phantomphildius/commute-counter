class LoginsController < ApplicationController
  def index
    client = Strava::OAuth::Client.new(
      client_id: Rails.application.credentials.strava.fetch(:client_id),
      client_secret: Rails.application.credentials.strava.fetch(:secret)
    )

    redirect_url = client.authorize_url(
      redirect_uri: 'http://localhost:3000/oauths',
      approval_prompt: 'force',
      response_type: 'code',
      scope: 'activity:read_all'
    )

    redirect_to redirect_url
  end
end
