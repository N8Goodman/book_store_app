require 'rails_helper'
require_relative '../factories/users'
feature "user authentication" do
# [X] As a prospective user
# I want to create an account
# So that I can post items and review them
#
# [ ] As an unauthenticated user
# I want to sign in
# So that I can post items and review them
#
# [ ] As an authenticated user
# I want to sign out
# So that no one else can post items or reviews on my
# behalf
#
# [ ] As an authenticated user
# I want to update my information
# So that I can keep my profile up to date
#
# [ ] As an authenticated user
# I want to delete my account
# So that my information is no longer retained by the app

  user1 = FactoryGirl.create(:user)
  user2 = FactoryGirl.create(:user)

  scenario "user enters valid data to create account" do
    visit "/users/sign_up"

    fill_in "Username", with: user1.user_name
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    fill_in "Password confirmation", with: user1.password

    click_on "Sign Up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user enters invalid data to create account" do
    visit "/users/sign_up"

    fill_in "Username", with: user2.user_name
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    fill_in "Password confirmation", with: "Ooga Booga"
    click_on "Sign Up"

    expect(page).to_not have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "confirmation doesn't match Password"
  end
end
