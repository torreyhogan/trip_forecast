class PlacesController < ApplicationController
	include HTTParty
	

	def trip_weather
		@yosemite_weather = rain_data(query("7262586")["list"])
		@deathvalley_weather = rain_data(query("5509851")["list"])
		@bigsur_weather = rain_data(query("5334320")["list"])
		@winner = lowest_weekend_total
	end

	# finds lowest weekend_total
	def lowest_weekend_total
		values = {"Yosemite" => weekend_total(@yosemite_weather), "Death Valley" => weekend_total(@deathvalley_weather), 
								"Big Sur" => weekend_total(@bigsur_weather)}
		sorted = values.sort_by { |key, value| value }
		sorted.first
	end

	# total percipitation on friday, saturday, and sunday combined
	def weekend_total(location_data)
		total = 0
		weekend = [0,5,6]
		location_data.each do |day, value|
			if weekend.include?(day.wday)
				total += (value[:rain] + value[:snow])
			end
		end
		total.to_i
	end

	# time and rain quantity mapped into array
	def rain_data(data)
		weather = {}
		data.each do |x| 
			if x["rain"] == nil || x["rain"].empty?
				rain = 0
			else
				rain = x["rain"]['3h']
			end
			# empty hash equals zero
			if x["snow"] == nil || x["snow"].empty?
				snow = 0
			else 
				snow = x["snow"]['3h']
			end
			# groups data into days of month
			day = to_date(x["dt"])
			if weather[day] == nil
				weather[day] = {rain: rain.to_i, snow: snow.to_i }
			else
				weather[day][:rain] += rain.to_i
				weather[day][:snow] += snow.to_i
			end
		end
		weather
	end

	# days from today
	def to_date(time_in)
		time_s = Time.at(time_in) #DateTime.strptime(time_in.to_s, '%s')
		pacific_time = time_s + Time.zone_offset("PDT")
		pacific_time.to_date #- Date.today)
	end


	def query(city_id)
		base_url = "http://api.openweathermap.org/data/2.5/forecast?id="
		api_partial_url = "&APPID=#{ENV['open_weather_api_key'].to_s}"
		url_input = base_url + city_id + api_partial_url
		request = HTTParty.get(url_input.to_s).to_json
		@request_hash = JSON.parse(request)
	end
end
