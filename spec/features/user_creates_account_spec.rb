require 'rails_helper'
require_relative '../factories/users'
feature "user authentication" do
# [ ] As a prospective user
#     I want to create an account
#     So that I can post items and review them
#
# [ ] As an unauthenticated user
#     I want to sign in
#     So that I can post items and review them
#
# [ ] As an authenticated user
#     I want to sign out
#     So that no one else can post items or reviews on my
#     behalf
#
# [ ] As an authenticated user
#     I want to update my information
#     So that I can keep my profile up to date
#
# [ ] As an authenticated user
#     I want to delete my account
#     So that my information is no longer retained by the app

  describe "user creates an account" do
      user = FactoryGirl.create(:user)

    scenario "user enters valid data to create account" do
      visit "/users/sign_up"

      fill_in "Username", with: user.user_name
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_on "Sign Up"

      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    scenario "user enters invalid data to create account" do
      visit "/users/sign_up"

      fill_in "Username", with: user.user_name
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: "Ooga Booga"
      click_on "Sign Up"
            save_and_open_page

      expect(page).to_not have_content "Welcome! You have signed up successfully."
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
    #
    # scenario "user enters invalid data to create account" do
    #   visit "/users/sign_up"
    #
    #   click_on "Sign Up"
    #
    #   expect(page).to_not have_content "Username can't be blank. Email can't be blank. Password can't be blank."
    # end
  end
end
