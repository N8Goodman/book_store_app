admin_user1 = User.find_by(email: "historybuff40@example.com")
unless admin_user1.present?
  admin_user1 = User.create(
    user_name: "history_buff",
    email: "historybuff40@example.com",
    password: "inthepast",
    password_confirmation: "inthepast",
    admin: true
)
end

admin_user2 = User.find_by(email: "awesomeadmin@example.com")
unless admin_user2.present?
  admin_user2 = User.create(
    user_name: "admin1",
    email: "awesomeadmin@example.com",
    password: "bestadmineva",
    password_confirmation: "bestadmineva",
    admin: true
)
end

non_admin_user1 = User.find_by(email: "booklover@example.com")
unless non_admin_user1.present?
  non_admin_user1 = User.create(
    user_name: "booklover1",
    email: "booklover@example.com",
    password: "12345678",
    password_confirmation: "12345678"
)
end

non_admin_user2 = User.find_by(email: "mystery.kate8@example.com")
unless non_admin_user2.present?
  non_admin_user2 = User.create(
    user_name: "mystery_kate",
    email: "mystery.kate8@example.com",
    password: "agathachristie",
    password_confirmation: "agathachristie"
)
end

non_admin_user3 = User.find_by(email: "bookmcbook@example.com")
unless non_admin_user3.present?
  non_admin_user3 = User.create(
    user_name: "bookyMcbook",
    email: "bookmcbook@example.com",
    password: "kindalikesbooks",
    password_confirmation: "kindalikesbooks"
)
end

non_admin_user4 = User.find_by(email: "iluvbooks81@example.com")
unless non_admin_user4.present?
  non_admin_user4 = User.create(
    user_name: "bookluv",
    email: "iluvbooks81@example.com",
    password: "booksforme",
    password_confirmation: "booksforme"
)
end

non_admin_user5 = User.find_by(email: "sci_fi_gal@example.com")
unless non_admin_user5.present?
  non_admin_user5 = User.create(
    user_name: "sci-fi#1",
    email: "sci_fi_gal@example.com",
    password: "terrybrooks",
    password_confirmation: "terrybrooks"
)
end

non_admin_user6 = User.find_by(email: "jwandme@example.com")
unless non_admin_user6.present?
  non_admin_user6 = User.create(
    user_name: "jwjuststudies",
    email: "jwandme@example.com",
    password: "textbooks4me",
    password_confirmation: "textbooks4me"
)
end

bookstore1 = Bookstore.find_or_create_by(
  name: "Best Books",
  address: "101 Main Street",
  city: "Boston",
  state: "MA",
  zip_code: "02111",
  user: admin_user1,
  img_url: "https://pbs.twimg.com/profile_images/730703875/twitter5.jpg"
)

bookstore2 = Bookstore.find_or_create_by(
  name: "Book Nook",
  address: "777 Main Street",
  city: "Edgartown",
  state: "MA",
  zip_code: "02539",
  user: non_admin_user6
)

bookstore3 = Bookstore.find_or_create_by(
  name: "Mystery Books",
  address: "333 Hidden Valley Ln.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02142",
  user: non_admin_user5
)

bookstore4 = Bookstore.find_or_create_by(
  name: "Anderson's Book Haven",
  address: "16 Oak Street",
  city: "Harrisburg",
  state: "PA",
  zip_code: "17112",
  user: admin_user2
)

bookstore5 = Bookstore.find_or_create_by(
  name: "Dragons & Empires",
  address: "55 Bow St.",
  city: "Somerville",
  state: "MA",
  zip_code: "02143",
  user: non_admin_user2
)

bookstore6 = Bookstore.find_or_create_by(
  name: "Fairytales and More",
  address: "789 Main St.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02139",
  user: non_admin_user3
)

bookstore7 = Bookstore.find_or_create_by(
  name: "Just Books",
  address: "888 Maple St.",
  city: "Camp Hill",
  state: "PA",
  zip_code: "17011",
  user: non_admin_user6
)

bookstore8 = Bookstore.find_or_create_by(
  name: "Bunch of Grapes Bookstore",
  address: "1234 Broadway St.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02138",
  user: non_admin_user4
)

bookstore9 = Bookstore.find_or_create_by(
  name: "Hey Yo Books",
  address: "900 Where Am I Street",
  city: "Helena",
  state: "MT",
  zip_code: "59601",
  user: non_admin_user2
)

bookstore10 = Bookstore.find_or_create_by(
  name: "Booksicles",
  address: "10 Whats Up Blvd",
  city: "Los Angeles",
  state: "CA",
  zip_code: "90046",
  user: non_admin_user2
)

b1_review1 = Review.find_or_create_by(
  user: non_admin_user1,
  bookstore: bookstore1,
  overall_rating: "3",
  price_rating: "4",
  variety_rating: "5",
  customer_service_rating: "3",
  body: "This place is pretty cool. It has the best books as the name implies!"
)

b1_review2 = Review.find_or_create_by(
  user: non_admin_user2,
  bookstore: bookstore1,
  overall_rating: "2",
  price_rating: "2",
  variety_rating: "2",
  customer_service_rating: "2",
  body: "Meh."
)

b1_review3 = Review.find_or_create_by(
  user: non_admin_user3,
  bookstore: bookstore1,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  body: "Best bookstore ever!"
)

b1_review4 = Review.find_or_create_by(
  user: non_admin_user4,
  bookstore: bookstore1,
  overall_rating: "3",
  price_rating: "4",
  variety_rating: "5",
  customer_service_rating: "2",
  body: "Awesome selection but the staff are a bit dodgy."
)
