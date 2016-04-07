require 'rails_helper'
require_relative '../factories/users'

  # [X] As an authenticated user
  # I want to delete my account
  # So that my information is no longer retained by the app

feature "user deletes their account" do

  let(:user1) { FactoryGirl.create(:user) }

  scenario "user deletes account successfully" do
    sign_in(user1)
    click_on("Update Profile")
    save_and_open_page

    click_on "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end
end
