require 'rails_helper'

feature "user edits a bookstore" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:bookstore1) { FactoryGirl.create(:bookstore, user: user1) }

  scenario "user edits a bookstore they created" do
    visit root_path
    sign_in(user1)
    click_link bookstore1.name

    click_link "Edit Bookstore"
    fill_in "City", with: "Juno"
    select "Alabama", from: "State"
    click_on "Submit Bookstore"

    expect(page).to have_content "Juno, AL"
  end

  scenario "user cannot edit different user's bookstore" do
    visit root_path
    sign_in(user2)
    click_link bookstore1.name

    expect(page).to_not have_button "Edit Bookstore"
  end

  scenario "non-user cannot edit a different user's bookstore" do
    visit root_path
    click_link bookstore1.name

    expect(page).to_not have_button "Edit Bookstore"
  end
end
