require 'rails_helper'
feature "User can filter index by name using Search Bar;" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:cookies) do
    Bookstore.create(
      name: "Cookies",
      address: "33 Harrison Ave.",
      city: "Chinatown",
      state: "MA",
      zip_code: "02145",
      user: user
    )
  end
  let!(:cream) do
    Bookstore.create(
      name: "Cream",
      address: "82 Park Ave.",
      city: "Portland",
      state: "ME",
      zip_code: "04101",
      user: user
      )
    end
  let!(:coffee) do
    Bookstore.create(
      name: "Coffee",
      address: "50 Temple St.",
      city: "Somerville",
      state: "MA",
      zip_code: "02145",
      user: user
      )
    end
  scenario "user enters a string in search bar" do
    visit bookstores_path

    fill_in "search", with: "Co"
    click_on "Search"

    expect(page.current_path).to eq bookstores_path
    expect(page).to_not have_content("Cream")
    expect(page).to have_content("Coffee")
    expect(page).to have_content("Cookies")
  end
  scenario "user enters nothing in search bar but searches" do
    visit bookstores_path
    click_on "Search"

    expect(page.current_path).to eq bookstores_path
    expect(page).to have_content("Cream")
    expect(page).to have_content("Coffee")
    expect(page).to have_content("Cookies")
  end
end
