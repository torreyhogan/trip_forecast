class WeatherAPI
	include HTTParty

	BASE_URL = "api.openweathermap.org/data/2.5/weather?id="
	API_PARTIAL_URL = "APIID={ENV['open_weather_api_key']}"

	def query
		request = HTTParty.get(BASE_URL+@search_format+"&"API_PARTIAL_URL).to_json
		@request_hash = JSON.parse(request)
	end

	def initialize
		@search_format = "5378538"
	end

end