class Commute::Activity < ApplicationRecord
  self.table_name = 'commute_activities'

  belongs_to :user

  def self.from_remote(activity_id:, user:)
    client = Strava::RefreshableApiClient.new(user).build
    remote_activity = client.activity(activity_id)

    if remote_activity.commute?
      start_lat, start_lng = remote_activity.start_latlng
      end_lat, end_lng = remote_activity.end_latlng

      create_with(
        name: remote_activity.name,
        activity_date: remote_activity.start_date,
        start_lat: start_lat,
        start_lng: start_lng,
        end_lat: end_lat,
        end_lng: end_lng,
        time_elapsed_seconds: remote_activity.elapsed_time,
        distance_miles: remote_activity.distance_in_miles.round(2),
        user: user,
      ).find_or_initialize_by(remote_id: remote_activity.id)
    else
      nil
    end
  end
end
