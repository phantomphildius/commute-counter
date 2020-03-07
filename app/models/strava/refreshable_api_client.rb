class Strava::RefreshableApiClient
  def initialize(user)
  @user = user
  end

  def build
    refresh_user_access_token! if user.strava_oauth_token_expired?

    Strava::Api::Client.new(access_token: user.strava_oauth_token)
  end

  private

  attr_reader :user

  def refresh_user_access_token!
    refreshed_api_token = oauth_client.oauth_token(
      refresh_token: user.strava_refresh_token,
      grant_type: 'refresh_token'
    )

    user.update!(
      strava_oauth_token: refreshed_api_token.access_token,
      strava_refresh_token: refreshed_api_token.refresh_token,
      expires_at: refreshed_api_token.expires_at
    )

    user.reload
  end

  def oauth_client
    Strava::OAuth::Client.new(
      client_id: Rails.application.credentials.fetch(:strava).fetch(:client_id),
      client_secret: Rails.application.credentials.fetch(:strava).fetch(:secret)
    )
  end
end
