require 'rails_helper'

# [ X] As an unauthenticated user
# I want to sign in
# So that I can post items and review them

feature "user updates their profile" do
  let!(:user1) { FactoryGirl.create(:user, email: "ann3@example.com") }

  scenario "user updates profile successfully" do
    sign_in(user1)
    click_on("Update Profile")

    fill_in "Email", with: "ashley@example.com"
    fill_in "Current password", with: user1.password
    click_on "update-profile-button"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario "user uploads a profile photo" do
    sign_in(user1)
    click_on("Update Profile")

    fill_in "Email", with: "ashley@example.com"
    fill_in "Current password", with: user1.password
    attach_file "Avatar", "#{Rails.root}/spec/support/images/photo.png"
    click_on "update-profile-button"
    save_and_open_page
    expect(page).to have_content "Your account has been updated successfully."
    expect(page).to have_css("img[src*='photo.png']")
  end

  scenario "user updates profile unsuccessfully" do
    sign_in(user1)
    click_on("Update Profile")

    fill_in "Email", with: "ashley@example.com"
    click_on "update-profile-button"

    expect(page).to have_content "Current password can't be blank"
  end
end
