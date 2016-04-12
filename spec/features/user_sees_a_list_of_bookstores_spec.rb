require 'rails_helper'

feature "user sees a list of book stores" do
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:bookstore2) { FactoryGirl.create(:bookstore) }
  let!(:bookstore3) { FactoryGirl.create(:bookstore) }
  
  scenario 'user visits home page to view list of book stores' do
    visit root_path

    expect(page).to have_content(bookstore1.name)
    expect(page).to have_content(bookstore2.name)
  end
end
