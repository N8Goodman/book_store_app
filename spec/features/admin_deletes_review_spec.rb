require 'rails_helper'

# [ X] As an authenticated Admin
# I want to delete a review
# So I can remove inappropriate content

feature "admin deletes review" do
  let!(:user1) { FactoryGirl.create(:user, admin: true) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }

  let!(:bookstore1) { FactoryGirl.create(:bookstore, user: user2) }
  let!(:bookstore2) { FactoryGirl.create(:bookstore, user: user3) }

  let!(:review1) do
    FactoryGirl.create(:review,
      user: user3,
      bookstore: bookstore1
      )
  end
  let!(:review2) do
    FactoryGirl.create(:review,
      user: user2,
      bookstore: bookstore2
      )
  end

  scenario 'admin deletes review created by another user' do
    sign_in(user1)
    visit admin_bookstores_path

    click_on bookstore1.name

    click_on "delete#{review1.id}"

    expect(page).to have_content bookstore1.name
    expect(page.current_path).to eq edit_admin_bookstore_path(bookstore1.id)
    expect(page).to have_content "Review deleted successfully."
  end

  scenario "non-admin accesses admin bookstore index page unsucessfully" do
    sign_in(user2)
    visit admin_bookstores_path

    expect(page).to_not have_link("delete#{bookstore1.id}")
    expect(page).to have_content("Access denied!")
    expect(page.current_path).to eq root_path
  end
end
