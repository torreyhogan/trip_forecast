Rails.application.routes.draw do
  root 'places#trip_weather'
  get '/hey', to: 'places#hey'
end
