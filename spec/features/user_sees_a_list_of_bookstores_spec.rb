require 'rails_helper'
feature "user sees a list of book stores" do
  scenario 'user visits home page to view list of book stores' do
    visit '/'

    expect(page).to have_content('Bookends')
    expect(page).to have_content('Barnes and Noble')
    expect(page).to have_content('Brattle Book Shop')
  end
end
