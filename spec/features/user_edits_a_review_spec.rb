require 'rails_helper'

feature "user edits a review" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:review1) {
    FactoryGirl.create(:review, bookstore: bookstore1, user: user1)
  }

  scenario "user successfully edits a review they have posted" do
    visit root_path
    sign_in(user1)

    click_link bookstore1.name

    click_on "Edit Review"

    select '5', from: 'Overall Rating'
    select '5', from: 'Price Rating'
    select '5', from: 'Variety Rating'
    select '5', from: 'Customer Service Rating'

    click_button 'Submit Review'

    expect(page).to have_content "Overall: 5"
    expect(page).to have_content "Price: 5"
    expect(page).to have_content "Customer Service: 5"

  end

  scenario "user unsuccessfully edits a review they have posted" do
    visit root_path
    sign_in(user1)

    click_link bookstore1.name

    click_on "Edit Review"

    select '5', from: 'Price Rating'
    select '5', from: 'Variety Rating'
    select '5', from: 'Customer Service Rating'

    click_button 'Submit Review'

    expect(page).to have_content "Overall rating can't be blank"

  end

  scenario "user tries to edit another user's review" do
    visit root_path
    sign_in(user2)

    click_link bookstore1.name

    expect(page).to_not have_content "Edit Review"

  end

  scenario "non-user tries to edit a user's review" do
    visit root_path

    click_link bookstore1.name

    expect(page).to_not have_content "Edit Review"

  end

end
