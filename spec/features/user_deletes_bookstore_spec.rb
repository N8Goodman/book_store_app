require 'rails_helper'

feature "user deletes a bookstore from the website" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:bookstore1) { FactoryGirl.create(:bookstore, user: user1) }

  scenario  "user successfully deletes a bookstore they created" do
    visit root_path
    sign_in(user1)

    click_link bookstore1.name

    click_button "Delete Bookstore"

    expect(page).to_not have_content bookstore1.name
  end

  scenario  "user tries to delete a bookstore someone else created" do
    visit root_path
    sign_in(user2)

    click_link bookstore1.name

    expect(page).to_not have_button "Delete Bookstore"
  end

  scenario  "non-user tries to delete a bookstore someone else created" do
    visit root_path

    click_link bookstore1.name

    expect(page).to_not have_button "Delete Bookstore"
  end
end
