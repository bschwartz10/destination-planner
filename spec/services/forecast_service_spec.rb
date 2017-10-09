require 'rails_helper'

describe ForecastService do
  it "makes an api call to WU for a given city" do
    raw_forecast = ForecastService.forecast_10_day('80218')
    first_day = raw_forecast.first

    expect(raw_forecast.count).to eq 10
    expect(raw_forecast).to be_an Array
    expect(first_day).to be_a Hash
    expect(first_day).to have_key :high
    expect(first_day).to have_key :low
    expect(first_day).to have_key :date
    expect(first_day[:date]).to have_key :weekday
    expect(first_day[:date]).to have_key :monthname
    expect(first_day[:date]).to have_key :day
  end
end
