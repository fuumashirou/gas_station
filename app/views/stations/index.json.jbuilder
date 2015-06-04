json.array!(@stations) do |station|
  json.extract! station, :id, :name, :oct93, :oct94, :oct95, :city, :comune
  json.url station_url(station, format: :json)
end
