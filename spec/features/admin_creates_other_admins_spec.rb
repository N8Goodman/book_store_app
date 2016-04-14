require 'rails_helper'

# [ X] As an authenticated Admin
# I want to make another user an admin
# So more people can control the data

feature "Admin makes a non-admin user an admin" do

  let!(:admin_user1) { FactoryGirl.create(:user, admin: true) }
  let!(:non_admin_user2) { FactoryGirl.create(:user) }
  let!(:non_admin_user3) { FactoryGirl.create(:user) }

  scenario "Admin updates user to be an admin" do
    sign_in(admin_user1)
    visit admin_users_path

    expect(page).to_not have_link("revoke-admin#{non_admin_user3.id}")

    click_on "make-admin#{non_admin_user3.id}"

    expect(page).to have_content "#{non_admin_user3.user_name} is now an admin."
    expect(page).to have_link("revoke-admin#{non_admin_user3.id}")
    expect(page).to_not have_link("make-admin#{non_admin_user3.id}")
    expect(page).to_not have_link("revoke-admin#{non_admin_user2.id}")
  end

  scenario "non-admin accesses admin page unsucessfully" do
    sign_in(non_admin_user2)
    visit admin_users_path

    expect(page).to_not have_link("make-admin#{non_admin_user3.id}")
    expect(page).to have_content("Access denied!")
    expect(page.current_path).to eq root_path
  end
end
