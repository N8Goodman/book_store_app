require 'rails_helper'

  # [X] As an authenticated user
  # I want to delete my account
  # So that my information is no longer retained by the app

feature "user deletes their account" do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, user_name: "heyyythere") }
  let!(:bookstore1) { FactoryGirl.create(:bookstore, user: user1) }
  let!(:bookstore2) { FactoryGirl.create(:bookstore, user: user1) }
  let!(:bookstore3) { FactoryGirl.create(:bookstore, user: user2) }

  scenario "user deletes account successfully" do
    sign_in(user1)

    click_on("Update Profile")

    click_on "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end

  scenario "user deletes account and all bookstores they created" do
    sign_in(user1)

    expect(page).to have_content bookstore1.name
    expect(page).to have_content bookstore2.name
    expect(page).to have_content bookstore3.name

    click_on("Update Profile")

    click_on "Cancel my account"

    visit bookstores_path

    expect(page).to have_content bookstore3.name
    expect(page).to_not have_content bookstore1.name
    expect(page).to_not have_content bookstore2.name
  end
end
