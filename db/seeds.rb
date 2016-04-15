admin_user1 = User.find_by(email: "historybuff40@example.com")
unless admin_user1.present?
  admin_user1 = User.create(
    user_name: "history_buff",
    avatar: "uploads/users/admin_user1.jpeg",
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
    avatar: "uploads/users/admin_user2.jpeg",
    password: ENV["ADMIN_2_KEY"],
    password_confirmation: ENV["ADMIN_2_KEY"],
    admin: true
)
end

non_admin_user1 = User.find_by(email: "booklover@example.com")
unless non_admin_user1.present?
  non_admin_user1 = User.create(
    user_name: "booklover1",
    avatar: "uploads/users/user1.jpeg",
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
    avatar: "uploads/users/user2.jpeg",
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
    avatar: "uploads/users/user4.jpeg",
    password: "booksforme",
    password_confirmation: "booksforme"
)
end

non_admin_user5 = User.find_by(email: "sci_fi_gal@example.com")
unless non_admin_user5.present?
  non_admin_user5 = User.create(
    user_name: "sci-fi#1",
    email: "sci_fi_gal@example.com",
    avatar: "uploads/users/user5.jpeg",
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

non_admin_user7 = User.find_by(email: "thepearshape@example.com")
unless non_admin_user7.present?
  non_admin_user7 = User.create(
    user_name: "pear83",
    email: "thepearshape@example.com",
    password: "fashion4me",
    password_confirmation: "fashion4me"
)
end

non_admin_user8 = User.find_by(email: "dark.apprentice@example.com")
unless non_admin_user8.present?
  non_admin_user8 = User.create(
    user_name: "dark_side77",
    email: "dark.apprentice@example.com",
    password: "power4me",
    password_confirmation: "power4me"
)
end

bookstore1 = Bookstore.find_or_create_by(
  name: "Best Books",
  address: "101 Main St.",
  city: "Boston",
  state: "MA",
  zip_code: "02111",
  beverage: true,
  food: true,
  description: "Best Books sprang to life in May 1978 as a small, intimate bookstore offering titles by the newer voices as well as established authors. As the staff and customers tended the books with care much like a garden, the store grew and blossomed. By 1982, we  spread to three and a half floors, and added a cafe.",
  img_url: "http://athensohio.kevinmorganstudio.com/wp-content/uploads/2014/12/pendulo-bookstore.jpg",
  user: admin_user1

)

bookstore2 = Bookstore.find_or_create_by(
  name: "Octavia Books",
  address: "513 Main St.",
  city: "Edgartown",
  state: "MA",
  zip_code: "02539",
  beverage: true,
  description: " ",
  img_url: " http://www.octaviabooks.com/files/octaviabooks/Octavia_Books_10-09_106.jpg",
  user: non_admin_user6
)

bookstore3 = Bookstore.find_or_create_by(
  name: "Mystery Books",
  address: "333 Hidden Valley Ln.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02142",
  description: "When you come to Mystery Books you'll find a staff of voracious readers eager to recommend quality new and used books of all types.  Our display tables are covered with new releases, while our shelves are bursting with great backlist titles.",
  img_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI1Atuoa6MRu5zKGB3Q5zXPfwDrfIIh6KpT0wBb3FpwFaB9Mal",
  user: non_admin_user5
)

bookstore4 = Bookstore.find_or_create_by(
  name: "Anderson's Book Haven",
  address: "16 Oak St.",
  city: "Harrisburg",
  state: "PA",
  zip_code: "17112",
  description: "We sell a variety new books, postcards, cards, blank journals, gifts and magazines. We host events with local and national authors, support the community, and host a kids and adult book group.",
  img_url: "https://s-media-cache-ak0.pinimg.com/236x/10/b9/ab/10b9ab26c860fbd148f8a631722ab350.jpg",
  user: admin_user2
)

bookstore5 = Bookstore.find_or_create_by(
  name: "Greenlight Bookstore",
  address: "55 Bow St.",
  city: "Somerville",
  state: "MA",
  zip_code: "02143",
  img_url: "http://www.affinia.com/polopoly_fs/1.18972.1446493947!/fileImage/httpImage/image.jpg_gen/derivatives/landscape_1280/greenlight-bookstore.jpg",
  user: non_admin_user2
)

bookstore6 = Bookstore.find_or_create_by(
  name: "Fairytales and More",
  address: "789 Main St.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02139",
  description: "We are a local, independent bookstore. Our goal is to promote the love of reading to all, by carrying the best selection of books anywhere!",
  img_url: "http://www.chicagotribune.com/media/photo/2011-11/66187729.jpg",
  user: non_admin_user3
)

bookstore7 = Bookstore.find_or_create_by(
  name: "Just Books",
  address: "888 Maple St.",
  city: "Camp Hill",
  state: "PA",
  zip_code: "17011",
  description: "Your one stop shop for buying and selling textbooks and educational books.",
  img_url: "https://media2.wnyc.org/i/620/372/c/80/photologue/photos/MAIN_newstop%20bookstore.jpg",
  user: non_admin_user6
)

bookstore8 = Bookstore.find_or_create_by(
  name: "Bunch of Grapes Bookstore",
  address: "1234 Broadway St.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02138",
  img_url: "http://www.bunchofgrapes.com/files/bunchofgrapes/BOG_New_Front.jpg",
  user: non_admin_user4
)

bookstore9 = Bookstore.find_or_create_by(
  name: "Hey Yo Books",
  address: "900 Where Am I Street",
  city: "Helena",
  state: "MT",
  zip_code: "59601",
  img_url: "http://www.neontommy.com/sites/default/files/mt_legacy/bookstores_f.jpg",
  user: non_admin_user2
)

bookstore10 = Bookstore.find_or_create_by(
  name: "Litterally by Design",
  address: "731 Calvin Dr.",
  city: "Phoenix",
  state: "AZ",
  img_url: "http://pixel.brit.co/wp-content/uploads/2015/04/7918098388_a08c1d5d51_b-645x428.jpg",
  user: non_admin_user6
)

bookstore11 = Bookstore.find_or_create_by(
  name: "Craven's Edge",
  address: "7 South Water St.",
  city: "Rotunda West",
  state: "FL",
  zip_code: "33947",
  img_url: "https://onthewingsofthehummingbird.files.wordpress.com/2014/06/wallpaper-2646.jpg",
  user: non_admin_user5
)

bookstore12 = Bookstore.find_or_create_by(
  name: "From Austen to Zahn",
  address: "43 Winter Rd.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02138",
  img_url: "https://img.buzzfeed.com/buzzfeed-static/static/2014-07/2/11/enhanced/webdr08/grid-cell-25139-1404314658-0.jpg",
  user: admin_user2
)

bookstore13 = Bookstore.find_or_create_by(
  name: "The Written Word",
  address: "538 Kay Ln.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02142",
  img_url: "http://www.edrants.com/wp-content/uploads/2011/06/wordbrooklyn.jpg",
  user: non_admin_user2
)

bookstore14 = Bookstore.find_or_create_by(
  name: "The Gallery Bookstore",
  address: "45 Paisley Way",
  city: "Athens",
  state: "GA",
  zip_code: "30602",
  img_url: "http://www.gallerybookstorechicago.com/images/photos/new_sign_2011.jpg",
  user: non_admin_user3
)

bookstore15 = Bookstore.find_or_create_by(
  name: "Under Cover",
  address: "87 East 17th St.",
  city: "Boston",
  state: "MA",
  zip_code: "02115",
  img_url:"https://s-media-cache-ak0.pinimg.com/736x/0b/c5/51/0bc551a1711d8aa92dad26d0c89efc5e.jpg",
  user: non_admin_user6
)

bookstore16 = Bookstore.find_or_create_by(
  name: "Intellectual Investments",
  address: "34 Lighhouse Rd.",
  city: "Cambridge",
  state: "MA",
  zip_code: "02138",
  img_url: "http://www.rizzoliusa.com/files/2014/01/altRIZZOLI-superJumbo.jpg",
  user: non_admin_user4
)

bookstore17 = Bookstore.find_or_create_by(
  name: "Comedy of Errors",
  address: "65 Lake St.",
  city: "Boston",
  state: "MA",
  zip_code: "02111",
  beverage: true,
  food: true,
  description: "We offer over 60,000 Books, Movies, LP's, CD's. We also recently begin serving Coffee, Teas & Cafe Food Items for all our events. Our hours will be expanding soon!",
  img_url: "http://mkandcompanyinteriordesign.files.wordpress.com/2014/01/rizzoli-bookstore-new_york_315_rizzoli_bookstore_4e9321fc6a1074205b0000e1_store_main_new.jpg",
  user: admin_user1
)

bookstore18 = Bookstore.find_or_create_by(
  name: "Colonial Books",
  address: "382 Summer St.",
  city: "Modesto",
  state: "CA",
  zip_code: "95351",
  img_url: "http://d3b8erylo0uriu.cloudfront.net/wp-content/uploads/2014/07/Quality-Quidditch-Supplies-1.jpg",
  user: non_admin_user6
)

bookstore19 = Bookstore.find_or_create_by(
  name: "Non-sequiturs",
  address: "42 River Rd.",
  city: "Ackworth",
  state: "IA",
  zip_code: "50001",
  img_url: "http://cdn.mhpbooks.com/uploads/2014/04/IMG_0443.jpg",
  user: non_admin_user5
)

bookstore20 = Bookstore.find_or_create_by(
  name: "Absurd Literature",
  address: "7 Pine St.",
  city: "Nashville",
  state: "TN",
  zip_code: "37115",
  img_url: "https://img.washingtonpost.com/rf/image_1484w/2010-2019/WashingtonPost/2015/09/21/Magazine/Images/IMG_8682.JPG?uuid=kktsQGCDEeWXV-SSc_BfZQ",
  user: admin_user2
)

bookstore21 = Bookstore.find_or_create_by(
  name: "Booksicles",
  address: "10 Whats Up Blvd",
  city: "Los Angeles",
  state: "CA",
  zip_code: "90046",
  img_url: "http://today.brown.edu/files/images/BookstoreDesk.jpg",
  user: non_admin_user2
)

bookstore22 = Bookstore.find_or_create_by(
  name: "City Lights",
  address: "19 Berry St.",
  city: "Helena",
  state: "MT",
  zip_code: "59601",
  description: "We are a bookshop, not a gift shop, so there's not much here except books.  However we do have some very nice journals, some excellent book lights, a small selection of cool gifts, and our own City Lights T-shirts.",
  img_url: "http://img2.10bestmedia.com/Images/Photos/34789/city-lights-bookstore-san-francisco-ca-usa-shopping-search-all-shopping-1554895_54_990x660_201406011146.jpg",
  user: admin_user1
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
  beverage_rating: "3",
  food_rating: "3",
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
  bookstore: bookstore2,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  beverage_rating: "5",
  body: "Amazing!!!"
)

b2_review2 = Review.find_or_create_by(
  user: admin_user2,
  bookstore: bookstore2,
  overall_rating: "2",
  price_rating: "2",
  variety_rating: "3",
  customer_service_rating: "3",
  beverage_rating: "5"
)

b2_review3 = Review.find_or_create_by(
  user: non_admin_user7,
  bookstore: bookstore2,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  body: "Best bookstore ever!"
)

b3_review1 = Review.find_or_create_by(
  user: non_admin_user3,
  bookstore: bookstore3,
  overall_rating: "3",
  price_rating: "3",
  variety_rating: "4",
  customer_service_rating: "2",
  body: "I dunno. It was OK, I guess."
)

b3_review2 = Review.find_or_create_by(
  user: non_admin_user6,
  bookstore: bookstore3,
  overall_rating: "3",
  price_rating: "3",
  variety_rating: "3",
  customer_service_rating: "3"
)

b4_review1 = Review.find_or_create_by(
  user: non_admin_user1,
  bookstore: bookstore4,
  overall_rating: "2",
  price_rating: "3",
  variety_rating: "2",
  customer_service_rating: "2",
  body: "Not. Impressed."
)

b4_review2 = Review.find_or_create_by(
  user: non_admin_user2,
  bookstore: bookstore4,
  overall_rating: "1",
  price_rating: "1",
  variety_rating: "1",
  customer_service_rating: "1",
  body: "Awful! Stay away!"
)

b4_review3 = Review.find_or_create_by(
  user: non_admin_user3,
  bookstore: bookstore4,
  overall_rating: "2",
  price_rating: "1",
  variety_rating: "2",
  customer_service_rating: "1"
)

b5_review1 = Review.find_or_create_by(
  user: non_admin_user3,
  bookstore: bookstore5,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  body: "Finally! I found MY bookstore!"
)

b5_review2 = Review.find_or_create_by(
  user: non_admin_user6,
  bookstore: bookstore5,
  overall_rating: "3",
  price_rating: "4",
  variety_rating: "4",
  customer_service_rating: "3"
)

b5_review3 = Review.find_or_create_by(
  user: non_admin_user1,
  bookstore: bookstore5,
  overall_rating: "4",
  price_rating: "5",
  variety_rating: "4",
  customer_service_rating: "4"
)

b5_review4 = Review.find_or_create_by(
  user: non_admin_user2,
  bookstore: bookstore5,
  overall_rating: "4",
  price_rating: "5",
  variety_rating: "4",
  customer_service_rating: "5",
  body: "Great prices but I wish they had a better non-fiction section."
)

b6_review1 = Review.find_or_create_by(
  user: non_admin_user3,
  bookstore: bookstore6,
  overall_rating: "3",
  price_rating: "3",
  variety_rating: "3",
  customer_service_rating: "5",
  body: "Great customer service but this place is really only ideal for families with small children"
)

b6_review2 = Review.find_or_create_by(
  user: non_admin_user5,
  bookstore: bookstore6,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "4",
  customer_service_rating: "5",
  body: "Nice place."
)

b14_review1 = Review.find_or_create_by(
  user: non_admin_user5,
  bookstore: bookstore14,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "3",
  customer_service_rating: "4",
  body: "If you want more bang for your buck this is the place."
)

b15_review1 = Review.find_or_create_by(
  user: non_admin_user5,
  bookstore: bookstore15,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  body: "Really love this particular store. It's big and they always have more books than my public library. I could spend the entire day there. "
)

b15_review2 = Review.find_or_create_by(
  user: non_admin_user7,
  bookstore: bookstore15,
  overall_rating: "4",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "3",
  body: "Staff is overall friendly and helpful but it can get crowded and have long lines at busy times."
)

b17_review1 = Review.find_or_create_by(
  user: non_admin_user3,
  bookstore: bookstore17,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  body: "They have wonderful events and I especially enjoy the poetry readings here."
)

b18_review1 = Review.find_or_create_by(
  user: non_admin_user6,
  bookstore: bookstore18,
  overall_rating: "5",
  price_rating: "4",
  variety_rating: "5",
  customer_service_rating: "4",
  body: "Besides books, they have some great cards, t-shirts, and other small finds.  There are play areas for kids, fantastical decorations, and shelves overflowing with...BOOKS!  It is beautiful."
)

b18_review2 = Review.find_or_create_by(
  user: non_admin_user7,
  bookstore: bookstore18,
  overall_rating: "5",
  price_rating: "5",
  variety_rating: "5",
  customer_service_rating: "5",
  body: "SO fun! The best!"
)
