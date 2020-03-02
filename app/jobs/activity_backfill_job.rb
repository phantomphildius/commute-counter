class ActivityBackfillJob < ApplicationJob
  queue_as :default

  def perform(user)
    remote_commutes = fetch_remote_commutes_for(user: user)

    remote_commutes.each do |commute|
      ActivityBuilderJob.perform_later(
        strava_user_id: user.uid,
        activity_id: commute.id,
        calculate_transit_time: false
      )
    end
  end

  private

  attr_reader :user

  def fetch_remote_commutes_for(user:)
    Strava::Api::Client.new(access_token: user.strava_oauth_token).athlete_activities.select(&:commute)
  end
end
