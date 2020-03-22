class ActivityBuilderJob < ApplicationJob
  queue_as :default

  def perform(strava_user_id:, activity_id:, calculate_transit_time:)
    user = user_by(strava_user_id: strava_user_id)
    activity = fetch_remote_activity(user: user, activity_id: activity_id)

    if activity.nil?
      Rails.logger.info 'Non commute activity received'
      return
    end

    ActiveRecord::Base.transaction do
      activity.save!

      if calculate_transit_time
        transit = build_transit(activity)
        transit.save!
      end
    end
  end

  private

  def user_by(strava_user_id:)
    User.find_by!(uid: strava_user_id)
  end

  def fetch_remote_activity(user:, activity_id:)
    Commute::Activity.from_remote(activity_id: activity_id, user: user)
  end

  def build_transit(activity)
    transit_time = Commute::TransitTime.new(activity).calculate
    Commute::Transit.new(
      time_elapsed_seconds: transit_time,
      activity: activity
    )
  end
end
