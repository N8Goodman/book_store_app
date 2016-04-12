require 'rails_helper'

# [ X] As an authenticated Admin
# I want to make another user an admin
# So more people can control the data

feature "Admin makes a user an admin" do

  let!(:user1) { FactoryGirl.create(:user, admin: true) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }

  scenario "Admin updates user to be an admin" do
    sign_in(user1)
    visit admin_users_path

    expect(page).to_not have_link("revoke-admin#{user3.id}")

    click_on "make-admin#{user3.id}"

    expect(page).to have_content "#{user3.user_name} is now an admin."
    expect(page).to have_link("revoke-admin#{user3.id}")
    expect(page).to_not have_link("make-admin#{user3.id}")
    expect(page).to_not have_link("revoke-admin#{user2.id}")
  end

  scenario "non-admin accesses admin page unsucessfully" do
    sign_in(user2)
    visit admin_users_path

    expect(page).to_not have_link("make-admin#{user3.id}")
    expect(page).to have_content("Access denied!")
    expect(page.current_path).to eq root_path
  end
end
