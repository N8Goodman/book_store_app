require 'rails_helper'

# [X] As an authenticated user
# I want to sign out
# So that no one else can post items or reviews on my
# behalf

feature "user signs out" do
  let(:user1) { FactoryGirl.create(:user) }

  scenario "user enters valid sign in information and then signs out" do
    sign_in(user1)
    click_on("Sign Out")
    expect(page).to have_content "Signed out successfully."
  end
end
