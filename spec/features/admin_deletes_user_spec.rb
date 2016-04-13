require 'rails_helper'
# [ X] As an authenticated Admin
# I want to delete a user
# So I can remove malicious users
feature "Admin deletes user" do
  let!(:admin_user1) { FactoryGirl.create(:user, admin: true) }
  let!(:non_admin_user2) { FactoryGirl.create(:user) }
  let!(:non_admin_user3) { FactoryGirl.create(:user) }

  scenario "Admin deletes user" do
    sign_in(admin_user1)
    visit admin_users_path

    expect(page).to have_content admin_user1.user_name
    expect(page).to have_content non_admin_user2.user_name
    expect(page).to have_content non_admin_user3.user_name

    click_on "delete#{non_admin_user2.id}"

    expect(page).to_not have_content non_admin_user2.user_name
    expect(page).to have_content admin_user1.user_name
    expect(page).to have_content non_admin_user3.user_name
    expect(page).to have_content "User deleted successfully."
  end

  scenario "non-admin accesses admin users index page unsucessfully" do
    sign_in(non_admin_user2)
    visit admin_users_path

    expect(page).to_not have_link("delete#{non_admin_user2.id}")
    expect(page).to have_content("Access denied!")
    expect(page.current_path).to eq root_path
  end
end
