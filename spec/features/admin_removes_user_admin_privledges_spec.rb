require 'rails_helper'

# [ X] As an authenticated Admin
# I want to revoke another user's admin abilities
# So user data is up to date

feature "Admin revokes user's admin privledges" do

  let!(:admin_user1) { FactoryGirl.create(:user, admin: true) }
  let!(:admin_user2) { FactoryGirl.create(:user, admin: true) }
  let!(:non_admin_user3) { FactoryGirl.create(:user) }


  scenario "Admin updates non-admin user to be an admin" do
    sign_in(admin_user1)
    visit admin_users_path

    expect(page).to_not have_link("make-admin#{admin_user2.id}")

    click_on "revoke-admin#{admin_user2.id}"

    expect(page).to have_content "#{admin_user2.user_name} is no longer an admin."
    expect(page).to have_link("make-admin#{admin_user2.id}")
    expect(page).to_not have_link("revoke-admin#{admin_user2.id}")
  end

  scenario "non-admin accesses admin users index page unsucessfully" do
    sign_in(non_admin_user3)
    visit admin_users_path

    expect(page).to_not have_link("make-admin#{non_admin_user3.id}")
    expect(page).to have_content("Access denied!")
    expect(page.current_path).to eq root_path
  end
end
