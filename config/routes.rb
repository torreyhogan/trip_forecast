Rails.application.routes.draw do
  # get '/sequoia', to: 'places#sequoia'
  # get '/desolation_wilderness', to: 'places#desolation'
  # get '/yosemite', to: 'places#yosemite'
  get '/trip_weather', to: 'places#trip_weather'
end
