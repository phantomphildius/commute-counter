class SavingsCalculators::TimeCost
  def initialize(activity)
    @activity = activity
  end

  def savings
    transit_time = google_distance_matrix.shortest_route_by_duration_to(start_point).duration_in_seconds
    ((transit_time - activity.elapsed_time).to_f / 60).ceil
  end

  private

  attr_reader :activity

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

  def start_point
    lat, lng = activity.start_latlng
    GoogleDistanceMatrix::Place.new(lat: lat, lng: lng)
  end

  def end_point
    lat, lng = activity.end_latlng
    GoogleDistanceMatrix::Place.new(lat: lat, lng: lng)
  end
end
