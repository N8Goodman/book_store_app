require 'rails_helper'
require_relative '../factories/factories'

feature "user votes on a review" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:review1) { FactoryGirl.create(:review, bookstore: bookstore1) }

  scenario 'user successfully votes on a review' do
    visit root_path
    sign_in(user1)

    click_link bookstore1.name

    click_button "+1"
    expect(page).to have_content "1 #{review1.body}"
    expect(page).to_not have_content "0 #{review1.body}"
  end

  scenario 'user tries to add a second of the same vote on a review' do
    visit root_path
    sign_in(user1)

    click_link bookstore1.name

    click_button "+1"
    click_button "+1"

    expect(page).to have_content("You have already voted")
  end

  scenario 'user changes their vote on a review' do
    visit root_path
    sign_in(user1)

    click_link bookstore1.name

    click_button "+1"
    click_button "-1"

    expect(page).to have_content "-1 #{review1.body}"
  end

  scenario 'user tries to vote without being signed in' do
    visit root_path

    click_link bookstore1.name

    click_button "+1"
    click_button "-1"

    expect(page).to have_content "You must be signed in"
  end
end
