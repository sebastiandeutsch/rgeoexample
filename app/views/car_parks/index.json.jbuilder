json.array!(@car_parks) do |car_park|
  json.extract! car_park, :id, :name, :street, :zip, :city
  json.url car_park_url(car_park, format: :json)
end
