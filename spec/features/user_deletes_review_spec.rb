require 'rails_helper'
feature "user deletes a review from the website" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:bookstore1) { FactoryGirl.create(:bookstore, user: user1) }
  let!(:review1) do
    FactoryGirl.create(:review, bookstore: bookstore1, user: user1)
  end
  scenario  "user successfully deletes a review they created" do
    visit root_path
    sign_in(user1)
    click_link bookstore1.name
    click_button "Delete Review"

    expect(page).to_not have_content review1.body
  end
  scenario  "user tries to delete a review someone else created" do
    visit root_path
    sign_in(user2)
    click_link bookstore1.name

    expect(page).to_not have_button "Delete Review"
  end
  scenario  "non-user tries to delete a review someone else created" do
    visit root_path
    click_link bookstore1.name

    expect(page).to_not have_button "Delete Review"
  end
end
