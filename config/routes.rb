Rails.application.routes.draw do
  root 'places#trip_weather'
  # get '/trip_weather', to: 'places#trip_weather'
end
