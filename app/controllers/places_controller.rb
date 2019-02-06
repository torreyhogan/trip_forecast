class PlacesController < ApplicationController
	include HTTParty

	def trip_weather
		@weather = query("2172797")
	end

	def query(city_id)
		# BASE_URL = "api.openweathermap.org/data/2.5/weather?id="
		api_partial_url = "APIID={ENV['open_weather_api_key']}"
		# request = HTTParty.get(BASE_URL+city_id+"&"+API_PARTIAL_URL).to_json
		request = HTTParty.get("api.openweathermap.org/data/2.5/weather?id="+city_id+"&"+ api_partial_url).to_json
		@request_hash = JSON.parse(request)
	end
end
