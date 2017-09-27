require 'rails_helper'
# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and 10 day weather forecast
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions

RSpec.feature "See weather for indiviual destination", :type => :feature do
  scenario "User visits destination show page" do

    Destination.create(
                        name: 'Seattle',
                        zip:  '98112',
                        description: 'Rainy',
                        image_url: Faker::Placeholdit.image
    )

    visit root_path
    click_on 'Seattle'

    expect(page).to have_content('Seattle')
    expect(page).to have_content('Zip: 98112')
    expect(page).to have_content('Description: Rainy')
    expect(page).to have_content('Date: Thursday, September 28th')
    expect(page).to have_content('High: 81 degrees')
    expect(page).to have_content('Low: 59 degrees')

  end
end
