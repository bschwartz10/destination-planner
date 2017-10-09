class ForecastService
  def self.forecast_10_day(zipcode)
    request= Faraday.get("http://api.wunderground.com/api/329730529a846a1a/forecast10day/q/#{zipcode}.json")
    response = JSON.parse(request.body, symbolize_names: true)[:forecast][:simpleforecast][:forecastday]
  end

end
