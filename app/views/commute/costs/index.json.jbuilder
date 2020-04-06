json.array! @costs do |cost|
  json.(cost, :id, :name, :price_cents)
end
