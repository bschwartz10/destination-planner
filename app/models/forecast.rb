class Forecast
  attr_reader :high, :low, :weekday, :monthname, :day
  def initialize(raw_forecast)
    @high = raw_forecast[:high][:fahrenheit]
    @low  = raw_forecast[:low][:fahrenheit]
    @weekday = raw_forecast[:date][:weekday]
    @monthname = raw_forecast[:date][:monthname]
    @day = raw_forecast[:date][:day]
  end

  def date
    "#{weekday}, #{monthname} #{day}"
  end

  def self.forecast_10_day(zipcode)
    ForecastService.forecast_10_day(zipcode).map do |forecast|
      Forecast.new(forecast)
    end
  end
end
    # request= Faraday.get("http://api.wunderground.com/api/329730529a846a1a/forecast10day/q/#{name}.json")
    # response = JSON.parse(request.body)
    # weekday = response['forecast']['simpleforecast']['forecastday'][1]['date']['weekday']
    # month = response['forecast']['simpleforecast']['forecastday'][1]['date']['monthname'].to_s
    # day = response['forecast']['simpleforecast']['forecastday'][1]['date']['day'].to_s
    # high = response['forecast']['simpleforecast']['forecastday'][1]['high']['fahrenheit']
    # low = response['forecast']['simpleforecast']['forecastday'][1]['low']['fahrenheit']
    # date = weekday + ', ' + month + ' ' + day + 'th'
# ForcastService.get_forecast(name)
