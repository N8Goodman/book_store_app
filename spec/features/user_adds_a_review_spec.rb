require 'rails_helper'

feature "user sees a specific bookstore page" do
  zip = "18900"
  let!(:bookends) do
    Bookstore.create(
      name: "Bookends",
      address: "559 Main St",
      city: "Winchester",
      state: "MA",
      zip_code: zip.to_i,
      url: "http://www.bookendswinchester.com/",
      img_url: "http://www.booksite.com/cilla/bookends/CAIZ8923.jpg",
      description: "A nice little bookstore",
      beverage: false,
      food: true
    )
  end

  scenario 'user visits page for a specific bookstore' do
    visit '/'

    click_link 'Bookends'
    fill_in "Comments:", with: "This place is awesome!"


    select '5', from: 'Overall Rating'
    select '5', from: 'Price Rating'
    select '5', from: 'Variety Rating'
    select '5', from: 'Customer Service Rating'

    click_button 'Add Review'
    save_and_open_page
  end
end
