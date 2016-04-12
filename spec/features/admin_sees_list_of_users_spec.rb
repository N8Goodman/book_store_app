require 'rails_helper'
# [ X] As an authenticated Admin
# I want to view a list of users
# So I can review and delete them
feature "Admin sees list of users" do
  let!(:user1) { FactoryGirl.create(:user, admin: true) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }
  scenario "Admin sees list of users" do
    sign_in(user1)
    visit admin_users_path

    expect(page).to have_content user2.user_name
    expect(page).to have_content user3.user_name
  end
  scenario "non-admin user does not see list of users" do
    sign_in(user2)
    visit admin_users_path

    expect(page).to_not have_content user1.user_name
    expect(page).to_not have_content user3.user_name
    expect(page).to have_content("Access denied!")
  end
end
