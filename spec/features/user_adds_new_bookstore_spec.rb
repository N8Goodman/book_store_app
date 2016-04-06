require 'rails_helper'

feature "user adds a new bookstore page" do
  scenario 'user successfully adds a bookstore' do
    visit '/'

    click_link "Add New Bookstore"

    fill_in "Name", with: "Booky"
    fill_in "Address", with: "102 Main Street"
    fill_in "City", with: "Cambridge"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "99999"
    click_button "Add Bookstore"

    expect(page).to have_content "Booky Reviews"
  end

  scenario 'user tries to submit a blank form' do
    visit '/'

    click_link "Add New Bookstore"

    click_button "Add Bookstore"

    expect(page).to have_content "
    Name can't be blank,
    Address can't be blank,
    City can't be blank,
    Zip code is not a number,
    Zip code is the wrong length (should be 5 characters)
    "

  end

  scenario 'user tries to submit an incomplete form' do
    visit '/'

    click_link "Add New Bookstore"

    fill_in "Name", with: "Booky"
    fill_in "City", with: "Cambridge"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "99999"
    click_button "Add Bookstore"

    expect(page).to have_content "Address can't be blank"
  end

  scenario 'user tries to submit an invalid zip' do
    visit '/'

    click_link "Add New Bookstore"

    fill_in "Name", with: "Booky"
    fill_in "Address", with: "102 Main Street"
    fill_in "City", with: "Cambridge"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "9999"
    click_button "Add Bookstore"

    expect(page).to have_content "Zip code is the wrong length"
  end
end
