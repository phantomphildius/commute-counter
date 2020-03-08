json.array! @activities do |activity|
  json.(activity, :name, :id, :time_elapsed_seconds, :distance_miles)
end
