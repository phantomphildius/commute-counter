json.array! @activities do |activity|
  json.(activity, :name, :id)
end
