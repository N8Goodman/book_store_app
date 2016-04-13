require 'rails_helper'

# [ X] As an authenticated Admin
# I want to delete a bookstore
# So I can monitor content

feature "admin deletes bookstore" do
  let!(:admin_user1) { FactoryGirl.create(:user, admin: true) }
  let!(:non_admin_user2) { FactoryGirl.create(:user)
  }

  let!(:bookstore1) { FactoryGirl.create(:bookstore, user: non_admin_user2) }
  let!(:bookstore2) { FactoryGirl.create(:bookstore, user: non_admin_user2) }

  scenario 'admin deletes bookstore created by another user' do
    sign_in(admin_user1)
    visit admin_bookstores_path

    expect(page).to have_content bookstore1.name
    expect(page).to have_content bookstore2.name

    click_on "delete#{bookstore1.id}"

    expect(page).to_not have_content bookstore1.name
    expect(page).to have_content bookstore2.name
    expect(page).to have_content "Bookstore deleted successfully."
  end

  scenario "non-admin accesses admin bookstore index page unsucessfully" do
    sign_in(non_admin_user2)
    visit admin_bookstores_path

    expect(page).to_not have_link("delete#{bookstore1.id}")
    expect(page).to have_content("Access denied!")
    expect(page.current_path).to eq root_path
  end
end
