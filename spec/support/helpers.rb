module Helpers
  def sign_in(user)
    visit root_path

    click_on "Log In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on("log-in-button")
  end

  def create_bookstore(user, bookstore)
    sign_in(user)
    
  end
end
