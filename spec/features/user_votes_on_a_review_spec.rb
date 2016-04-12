require 'rails_helper'

feature "user votes on a review", js: true do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:review1) { FactoryGirl.create(:review, bookstore: bookstore1, user: user1) }

  scenario 'user successfully votes on a review' do
    visit root_path
    sign_in(user1)
    click_link bookstore1.name
    expect_no_page_reload do
      click_link "+1"
      expect(page).to have_content "Vote Total: 1"
      expect(page).to_not have_content "Vote Total: 0"
    end
  end

  scenario 'user tries to add a second of the same vote on a review' do
    visit root_path
    sign_in(user1)

    click_link bookstore1.name

    click_link "+1"
    click_link "+1"

    expect(page).to have_content("Vote Total: 0")
  end

  scenario 'user changes their vote on a review' do
    visit root_path
    sign_in(user1)

    click_link bookstore1.name

    click_link "+1"
    click_link "-1"

    expect(page).to have_content "Vote Total: -1"
    expect(page).to_not have_content "Vote Total: 1"
  end
  
  scenario 'user tries to vote without being signed in' do
    visit root_path

    click_link bookstore1.name

    click_link "+1"
    click_link "-1"

    text = page.driver.browser.switch_to.alert.text
    expect(text).to eq "You must be signed in"
  end
end
