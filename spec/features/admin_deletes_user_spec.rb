require 'rails_helper'
# [ X] As an authenticated Admin
# I want to delete a user
# So I can remove malicious users
feature "Admin deletes user" do
  let!(:user1) { FactoryGirl.create(:user, admin: true) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }

  scenario "Admin deletes user" do
    sign_in(user1)
    visit admin_users_path

    expect(page).to have_content user1.user_name
    expect(page).to have_content user2.user_name
    expect(page).to have_content user3.user_name

    click_on "delete#{user2.id}"

    expect(page).to_not have_content user2.user_name
    expect(page).to have_content user1.user_name
    expect(page).to have_content user3.user_name
    expect(page).to have_content "User deleted successfully."
  end

  scenario "non-admin accesses admin users index page unsucessfully" do
    sign_in(user2)
    visit admin_users_path

    expect(page).to_not have_link("delete#{user2.id}")
    expect(page).to have_content("Access denied!")
    expect(page.current_path).to eq root_path
  end
end
