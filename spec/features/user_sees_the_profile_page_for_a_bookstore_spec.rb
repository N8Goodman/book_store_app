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

  let!(:barnes) do
    Bookstore.create(
      name: "Barnes and Noble",
      address: "110 Corporate Drive",
      city: "Boston",
      state: "MA",
      zip_code: zip.to_i,
      url: "http://www.bookendswinchester.com/",
      img_url: "http://www.booksite.com/cilla/bookends/CAIZ8923.jpg",
      description: "A yuge chain",
      beverage: true,
      food: true
    )
  end

  scenario 'user visits page for a specific bookstore' do
    visit root_path

    click_link 'Bookends'

    expect(page).to have_content("Bookends")
    expect(page).to_not have_content("Barnes and Noble")
    expect(page).to have_content("Winchester")
  end
end
