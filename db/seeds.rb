
user1 = User.find_by(email: "booklover@example.com")
unless user1.present?
  user1 = User.create(
    user_name: "booklover1",
    email: "booklover@example.com",
    password: "12345678",
    password_confirmation: "12345678"
  )
end

user2 = User.find_by(email: "awesomeadmin@example.com")
unless user2.present?
  user2 = User.create(
    user_name: "admin1",
    email: "awesomeadmin@example.com",
    password: "bestadmineva",
    password_confirmation: "bestadmineva",
    admin: true
  )
end

user3 = User.find_by(email: "bookmcbook@example.com")
unless user3.present?
  user3 = User.create(
    user_name: "bookyMcbook",
    email: "bookmcbook@example.com",
    password: "kindalikesbooks",
    password_confirmation: "kindalikesbooks"
  )
end

bookstore1 = Bookstore.find_or_create_by(
  name: "Best Books",
  address: "101 Main Street",
  city: "Boston",
  state: "MA",
  zip_code: "02111",
  user: user1
)
