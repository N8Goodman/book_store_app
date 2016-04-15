require 'rails_helper'

feature "user votes on a review" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:review1) { FactoryGirl.create(:review, bookstore: bookstore1, user: user1) }

  scenario 'user successfully changes vote on a review' do
    visit root_path
    sign_in(user1)
    click_link bookstore1.name

    click_on "-1"
    expect(page).to have_content "Total: -1"
    expect(page).to_not have_content "Total: 1"

    click_on "+1"
    expect(page).to have_content "Total: 1"
    expect(page).to_not have_content "Total: 0"

  end

  scenario 'user successfully votes on a review' do
    visit root_path
    sign_in(user1)
    click_link bookstore1.name

    click_on "-1"
    expect(page).to have_content "Total: -1"
    expect(page).to_not have_content "Total: 1"
  end

  scenario 'user successfully cancels vote on a review' do
    visit root_path
    sign_in(user1)
    click_link bookstore1.name

    click_on "+1"
    expect(page).to have_content "Total: 1"
    expect(page).to_not have_content "Total: 0"

    click_on "+1"
    expect(page).to have_content("Total: 0")
  end

  scenario 'user tries to vote without being signed in' do
    visit root_path

    click_link bookstore1.name
    click_on "+1"

    expect(page).to have_content "You must be signed in"
  end
end
