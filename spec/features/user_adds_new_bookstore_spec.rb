require 'rails_helper'

feature "user adds a new bookstore page" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario 'user successfully adds a bookstore' do
    visit root_path

    sign_in(user1)

    click_link "Add New Bookstore"
    fill_in "Name", with: "Booky"
    fill_in "Address", with: "102 Main Street"
    fill_in "City", with: "Cambridge"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "99999"
    click_button "Submit Bookstore"

    expect(page).to have_content "Booky"
  end

  scenario 'user tries to submit a blank form' do
    visit root_path

    sign_in(user1)

    click_link "Add New Bookstore"

    click_button "Submit Bookstore"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "Zip code is not a number"
    expect(page).to have_content
    "Zip code is the wrong length (should be 5 characters)"
  end

  scenario 'user tries to submit an incomplete form' do
    visit root_path

    sign_in(user1)

    click_link "Add New Bookstore"

    fill_in "Name", with: "Booky"
    fill_in "City", with: "Cambridge"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "99999"
    click_button "Submit Bookstore"

    expect(page).to have_content "Address can't be blank"
  end

  scenario 'user tries to submit an invalid zip' do
    visit root_path

    sign_in(user1)

    click_link "Add New Bookstore"

    fill_in "Name", with: "Booky"
    fill_in "Address", with: "102 Main Street"
    fill_in "City", with: "Cambridge"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "9999"
    click_button "Submit Bookstore"

    expect(page).to have_content "Zip code is the wrong length"
  end

  scenario 'user is not signed in and tries to add a bookstore' do
    visit root_path

    click_link "Add New Bookstore"

    expect(page).to have_content "You must be signed in"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
    expect(page).to have_content "Password confirmation"
  end
end
