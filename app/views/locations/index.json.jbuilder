json.array!(@locations) do |location|
  json.extract! location, :id, :at
  json.url location_url(location, format: :json)
end
