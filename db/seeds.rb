# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RailwayStation.delete_all
Route.delete_all
Carriage.delete_all
Train.delete_all

stations_params = []

10.times do
  stations_params << { name: Faker::Address.city }
end

stations = RailwayStation.create(stations_params)

routes_params = []

10.times do
  stats = []
  (2..9).to_a.sample.times do
    stats << stations.sample
  end
  routes_params << {
    name: Faker::Lorem.sentence,
    railway_stations: stats.uniq
  }
end

routes = Route.create(routes_params)

routes.each do |route|
  route.railway_stations_routes.each_with_index do |row, index|
    row.position = index + 1
    row.arrival = DateTime.now
    row.departure = DateTime.now
    row.save
  end
end

trains_params = []

10.times do |number|
  route = routes.sample
  trains_params << { number: number, routes: [route], current_station: route.railway_stations.sample }
end

trains = Train.create(trains_params)

coupe_carriages_params = []

(0..100).each do |number|
  coupe_carriages_params << { number: number, train: trains.sample }
end

CoupeCarriage.create(coupe_carriages_params)

economy_carriages_params = []

(101..200).each do |number|
  economy_carriages_params << { number: number, train: trains.sample }
end

EconomyCarriage.create(economy_carriages_params)
