admin_user1 = User.find_by(email: "historybuff40@example.com")
unless admin_user1.present?
  admin_user1 = User.create(
    user_name: "history_buff",
    email: "historybuff40@example.com",
    password: ENV["ADMIN_1_KEY"],
    password_confirmation: ENV["ADMIN_1_KEY"],
    admin: true
)
end

admin_user2 = User.find_by(email: "awesomeadmin@example.com")
unless admin_user2.present?
  admin_user2 = User.create(
    user_name: "admin1",
    email: "awesomeadmin@example.com",
    password: ENV["ADMIN_2_KEY"],
    password_confirmation: ENV["ADMIN_2_KEY"],
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
  address: "101 Main St.",
  city: "Boston",
  state: "MA",
  zip_code: "02111",
  user: admin_user1
)

bookstore2 = Bookstore.find_or_create_by(
  name: "Book Nook",
  address: "777 Main St.",
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
  address: "16 Oak St.",
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
  name: "Chocolate & Pages",
  address: "19 Berry St.",
  city: "Helena",
  state: "MT",
  zip_code: "59601",
  user: admin_user1
)

bookstore10 = Bookstore.find_or_create_by(
  name: "Litterally by Design",
  address: "731 Calvin Dr.",
  city: "Phoenix",
  state: "AZ",
  zip_code: "85001",
  user: non_admin_user6
)

bookstore11 = Bookstore.find_or_create_by(
  name: "Craven's Edge",
  address: "7 South Water St.",
  city: "Rotunda West",
  state: "FL",
  zip_code: "33947",
  user: non_admin_user5
)

bookstore12 = Bookstore.find_or_create_by(
  name: "From Austen to Zahn",
  address: "43 Winter Rd.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02138",
  user: admin_user2
)

bookstore13 = Bookstore.find_or_create_by(
  name: "The Written Word",
  address: "538 Kay Ln.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02142",
  user: non_admin_user2
)

bookstore14 = Bookstore.find_or_create_by(
  name: "Argyle Books",
  address: "45 Paisley Way",
  city: "Athens",
  state: "GA",
  zip_code: "30602",
  user: non_admin_user3
)

bookstore15 = Bookstore.find_or_create_by(
  name: "Under Cover",
  address: "87 East 17th St.",
  city: "Boston",
  state: "MA",
  zip_code: "02115",
  user: non_admin_user6
)

bookstore16 = Bookstore.find_or_create_by(
  name: "Intellectual Investments",
  address: "34 Lighhouse Rd.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02138",
  user: non_admin_user4
)

bookstore17 = Bookstore.find_or_create_by(
  name: "Comedy of Errors",
  address: "65 Lake St.",
  city: "Boston",
  state: "MA",
  zip_code: "02111",
  user: admin_user1
)

bookstore18 = Bookstore.find_or_create_by(
  name: "Colonial Books",
  address: "382 Summer St.",
  city: "Modesto",
  state: "CA",
  zip_code: "95351",
  user: non_admin_user6
)

bookstore19 = Bookstore.find_or_create_by(
  name: "Anachronisms and Non-sequiturs",
  address: "42 River Rd.",
  city: "Ackworth",
  state: "IA",
  zip_code: "50001",
  user: non_admin_user5
)

bookstore20 = Bookstore.find_or_create_by(
  name: "Absurd Literature",
  address: "7 Pine St.",
  city: "Nashville",
  state: "TN",
  zip_code: "37115",
  user: admin_user2
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

b2_review1 = Review.find_or_create_by(
  user: admin_user1,
  bookstore: bookstore1,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  body: "Amazing!!!"
)

b2_review2 = Review.find_or_create_by(
  user: admin_user2,
  bookstore: bookstore1,
  overall_rating: "2",
  price_rating: "2",
  variety_rating: "2",
  customer_service_rating: "2"
)

b2_review3 = Review.find_or_create_by(
  user: non_admin_user7,
  bookstore: bookstore1,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  body: "Best bookstore ever!"
)

b2_review4 = Review.find_or_create_by(
  user: non_admin_user3,
  bookstore: bookstore1,
  overall_rating: "3",
  price_rating: "3",
  variety_rating: "4",
  customer_service_rating: "2",
  body: "Eh."
)
