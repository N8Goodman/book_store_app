require 'rails_helper'
require_relative '../factories/factories'

feature "user adds review" do
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:user1) { FactoryGirl.create(:user) }

  scenario 'user successfully adds a review' do
    visit root_path
    click_button "Sign In"

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Log in"

    click_link bookstore1.name
    fill_in "Comments:", with: "This place is awesome!"

    select '5', from: 'Overall Rating'
    select '3', from: 'Price Rating'
    select '5', from: 'Variety Rating'
    select '4', from: 'Customer Service Rating'

    click_button 'Add Review'

    expect(page).to have_content "Overall: 5"
    expect(page).to have_content "Price: 3"
    expect(page).to have_content "Customer Service: 4"
  end

  scenario 'user tries to add a review without signing in' do
    visit root_path

    click_link bookstore1.name
    fill_in "Comments:", with: "This place is awesome!"

    select '5', from: 'Overall Rating'
    select '3', from: 'Price Rating'
    select '5', from: 'Variety Rating'
    select '4', from: 'Customer Service Rating'

    click_button 'Add Review'

    expect(page).to have_content "You must be signed in"
    expect(page).to have_content bookstore1.name
  end
end
