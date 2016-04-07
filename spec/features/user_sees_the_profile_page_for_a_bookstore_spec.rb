require 'rails_helper'
require_relative '../factories/factories'

feature "user sees a specific bookstore page" do
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:bookstore2) { FactoryGirl.create(:bookstore) }
  let!(:bookstore3) { FactoryGirl.create(:bookstore) }

  scenario 'user visits page for a specific bookstore' do
    visit root_path

    click_link bookstore1.name

    expect(page).to have_content(bookstore1.name)
    expect(page).to_not have_content(bookstore2.name)
    expect(page).to have_content('Boston')
  end
end
