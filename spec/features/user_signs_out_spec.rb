require 'rails_helper'
require_relative '../factories/users'
feature "user signs out" do

# [X] As an authenticated user
# I want to sign out
# So that no one else can post items or reviews on my
# behalf

  let!(:user1) { FactoryGirl.create(:user) }

  scenario "user enters valid sign in information and then signs out" do
    visit "/"
    click_on("Log In")
    fill_in("Email", with: user1.email)
    fill_in("Password", with: user1.password)

    click_on("log-in-button")
    click_on("Log Out")
    expect(page).to have_content "Signed out successfully."
  end
end
