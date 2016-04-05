require 'rails_helper'
feature "user sees a list of book stores" do
  let!(:bookends) {Bookstore.create(name: "Bookends", address: "559 Main St", city: "Winchester", state: "MA", zip_code: "01890", url: "http://www.bookendswinchester.com/", img_url: "http://www.booksite.com/cilla/bookends/CAIZ8923.jpg", description: "A nice little bookstore", beverage: false, food: true )}
  let!(:barnes) {Bookstore.create(name: "Barnes and Noble", address: "110 Corporate Drive", city: "Boston", state: "MA", zip_code: "02125", url: "http://www.bookendswinchester.com/", img_url: "http://www.booksite.com/cilla/bookends/CAIZ8923.jpg", description: "A yuge chain", beverage: true, food: true )}
  scenario 'user visits home page to view list of book stores' do
    visit '/'

    expect(page).to have_content('Bookends')
    expect(page).to have_content('Barnes and Noble')
  end
end
