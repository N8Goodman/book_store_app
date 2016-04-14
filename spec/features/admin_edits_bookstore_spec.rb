require 'rails_helper'

# [ X] As an authenticated Admin
# I want to edit a bookstore
# So I can remove inappropriate or inaccurate content

feature "admin edits bookstore" do
  let!(:admin_user1) { FactoryGirl.create(:user, admin: true) }
  let!(:non_admin_user2) { FactoryGirl.create(:user) }
  let!(:non_admin_user3) { FactoryGirl.create(:user) }


    let!(:bookstore1) { FactoryGirl.create(:bookstore, user: non_admin_user2) }
    let!(:bookstore2) { FactoryGirl.create(:bookstore, user: non_admin_user3) }

  scenario 'admin edits bookstore created by another user' do
    sign_in(admin_user1)
    visit admin_bookstores_path

    expect(page).to_not have_content "100 Awesome Street"

    click_on bookstore1.name

    fill_in "Address", with: "100 Awesome Street"

    click_on "Submit Bookstore"

    expect(page).to have_content bookstore1.name
    expect(page.current_path).to eq admin_bookstores_path
    expect(page).to have_content "Bookstore updated successfully!"
    expect(page).to have_content "100 Awesome Street"
  end
end
