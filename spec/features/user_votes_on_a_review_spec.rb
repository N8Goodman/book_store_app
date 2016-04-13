require 'rails_helper'

feature "user votes on a review" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:review1) { FactoryGirl.create(:review, bookstore: bookstore1, user: user1) }

  scenario 'user successfully votes on a review', js: true do
    visit root_path
    sign_in(user1)
    click_link bookstore1.name

    click_on "-1"
    expect(page).to have_content "Vote Total: -2"
    expect(page).to_not have_content "Vote Total: 1"

    click_on "+1"
    expect(page).to have_content "Vote Total: -2"
    expect(page).to_not have_content "Vote Total: 0"

    click_on "+1"
    expect(page).to have_content("Vote Total: -2")
  end

  scenario 'user tries to vote without being signed in', js: true do
    visit root_path

    click_link bookstore1.name

    click_on "+1"
    click_on "-1"

    text = page.driver.browser.switch_to.alert.text
    expect(text).to eq "You must be signed in"
  end
end
