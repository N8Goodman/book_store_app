require 'rails_helper'
require_relative '../factories/users'
feature "user updates their profile" do

# [ X] As an unauthenticated user
# I want to sign in
# So that I can post items and review them
#
  let!(:user1) { FactoryGirl.create(:user, email: "ann3@example.com") }

  scenario "user updates profile successfully" do
    visit "/"
    click_on "Log In"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password

    click_on("log-in-button")
    click_on("Update Profile")

    fill_in "Email", with: "ashley@example.com"
    fill_in "Current password", with: user1.password
    click_on "update-profile-button"

    expect(page).to have_content "Your account has been updated successfully."
  end
end
