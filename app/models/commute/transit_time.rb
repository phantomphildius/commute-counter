class Commute::TransitTime
  def initialize(activity)
    @activity = activity
  end

  def calculate
    google_distance_matrix.shortest_route_by_duration_to(start_point).duration_in_seconds
  end

  private

  attr_reader :activity

  def start_point
    GoogleDistanceMatrix::Place.new(
      lat: activity.start_lat,
      lng: activity.start_lng
    )
  end

  def end_point
    GoogleDistanceMatrix::Place.new(
      lat: activity.end_lat,
      lng: activity.end_lng
    )
  end

  def google_distance_matrix
    matrix = GoogleDistanceMatrix::Matrix.new
    matrix.configure do |config|
      config.mode = 'transit'
      config.google_api_key = Rails.application.credentials.fetch(:google).fetch(:api_key)
    end
    matrix.origins << start_point
    matrix.destinations << end_point
    matrix
  end
end
