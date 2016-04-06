require 'rails_helper'
require_relative '../factories/users'
feature "user signs in" do

# [ X] As an unauthenticated user
# I want to sign in
# So that I can post items and review them
#
  let!(:user1) { FactoryGirl.create(:user) }

  scenario "user enters valid sign in information" do
    visit "/"
    click_on "Log In"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password

    click_on("log-in-button")
    expect(page).to have_content "Signed in successfully."
  end
end
