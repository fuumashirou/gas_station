json.array!(@stations) do |station|
  json.extract! station, :id, :type, :price, :city, :comune
  json.url station_url(station, format: :json)
end
