require 'rails_helper'

feature "Bookstore show page has hidden map", js: true do
  let!(:bookstore1) { FactoryGirl.create(:bookstore) }
  let!(:bookstore2) { FactoryGirl.create(:bookstore) }
  let!(:bookstore3) { FactoryGirl.create(:bookstore) }

  scenario "user loads show page, does not see map" do
    visit root_path

    click_link bookstore1.name

    expect(page).to_not have_css('#googleMap')
  end
  scenario "user clicks get map link and sees map" do
    visit root_path

    click_link bookstore1.name
    click_link 'Get Map'

    expect(page).to have_css('#googleMap')

  end
end
