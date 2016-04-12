require 'rails_helper'

# [ X] As an authenticated Admin
# I want to revoke another user's admin abilities
# So user data is up to date

feature "Admin revokes user's admin privledges" do

  let!(:user1) { FactoryGirl.create(:user, admin: true) }
  let!(:user2) { FactoryGirl.create(:user, admin: true) }
  let!(:user3) { FactoryGirl.create(:user) }

  scenario "Admin updates user to be an admin" do
    sign_in(user1)
    visit admin_users_path

    expect(page).to_not have_link("make-admin#{user2.id}")

    click_on "revoke-admin#{user2.id}"

    expect(page).to have_content "#{user2.user_name} is no longer an admin."
    expect(page).to have_link("make-admin#{user2.id}")
    expect(page).to_not have_link("revoke-admin#{user2.id}")
  end
end
