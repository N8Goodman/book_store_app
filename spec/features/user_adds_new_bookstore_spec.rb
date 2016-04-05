require 'rails_helper'
feature "user sees a specific bookstore page" do
  scenario 'user visits page for a specific bookstore' do
    visit '/'

    click_link "Add new bookstore"

    fill_in "Name", with: "Booky"
    fill_in "Address", with: "102 Main Street"
    fill_in "City", with: "Cambridge"
    select "MA", from: "State"
    fill_in "Zip Code", with: "99999"

  end
end
