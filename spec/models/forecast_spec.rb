require 'rails_helper'

describe Forecast do
  it "formats raw forcast data for display" do
    raw_forecast = { date: {monthname: 'September', weekday: 'Wednesday', day: 29},
                 high: {fahrenheit: 81},
                 low:  {fahrenheit: 59}
               }
    forecast = Forecast.new(raw_forecast)

    expect(forecast.high).to eq(81)
    expect(forecast.low).to eq(59)
    expect(forecast.date).to eq('Wednesday, September 29')
  end
end
# request= Faraday.get('http://api.wunderground.com/api/329730529a846a1a/forecast10day/q/Seattle.json')
# response = JSON.parse(request.body)
# weekday = response['forecast']['simpleforecast']['forecastday'][1]['date']['weekday']
# month = response['forecast']['simpleforecast']['forecastday'][1]['date']['monthname'].to_s
# day = response['forecast']['simpleforecast']['forecastday'][1]['date']['day'].to_s
# @high = response['forecast']['simpleforecast']['forecastday'][1]['high']['fahrenheit']
# @low = response['forecast']['simpleforecast']['forecastday'][1]['low']['fahrenheit']
# @date = weekday + ', ' + month + ' ' + day + 'th'
# en
