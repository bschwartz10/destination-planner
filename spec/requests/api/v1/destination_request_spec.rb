require 'rails_helper'

describe 'destination api' do
  it "returns all destinations" do
    create_list(:destination, 3)

    get '/api/v1/destinations'

    expect(response).to be_success

    destinations = JSON.parse(response.body)
    expect(destinations.count).to eq(3)
    expect(destinations.first).to have_key 'name'
  end

  it "returns a single destination" do
    sample_destination = create(:destination)

    get "/api/v1/destinations/#{sample_destination.id}"

    expect(response).to be_success

    destination = JSON.parse(response.body)
    expect(destination["id"]).to eq(sample_destination.id)
    expect(destination).to have_key 'name'
  end

  it "creates a destination" do
    destination_params = {
      name: 'Seattle',
      zip: '80103',
      description: 'Rainy and Grey',
      image_url: Faker::Placeholdit.image
    }

    post '/api/v1/destinations', params: destination_params

    expect(response).to be_success

    destination = Destination.last
    expect(destination.name).to eq('Seattle')
  end

  it "can update a destination" do
    sample_destination = create(:destination)

    destination_params = {
      name: 'New York'
    }

    patch "/api/v1/destinations/#{sample_destination.id}", params: destination_params

    expect(response).to be_success
    destination = Destination.find(sample_destination.id)
    expect(destination.name).to eq('New York')
  end

  it "can delete a destination" do
    sample_destination = create(:destination)

    expect(Destination.count).to eq(1)

    delete "/api/v1/destinations/#{sample_destination.id}"

    expect(response).to be_success
    expect(Destination.count).to eq(0)
  end
end
