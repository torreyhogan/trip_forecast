# README

Website determines the best weather for three different destinations during the weekend. Currently set to Big Sur, Death Valley, and Yosemite. Uses OpenWeatherMap API to obtain five day forcast with 3hr resolution. The five day percipitation forecast is displayed for each location. The location with the least amount of percipitation is displayed at the bottom of the page with the percipitiation amount.

Files with majority of code: 

	trip_forecast/app/controller/places_controller.rb
	trip_forecast/app/views/places/trip_weather.html.erb