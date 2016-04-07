FactoryGirl.define do
  sequence :email do |n|
    "bee#{n}@example.com"
  end

  factory :user do
    sequence(:user_name) { |n| "user#{n}" }
    sequence(:email) { |n| "email#{n}@email.com" }
    password "buzzbuzzbuzzzzzzz"
  end

  factory :bookstore do
    sequence(:name) { |n| "Book Store #{n}" }
    sequence(:address) { |n| "#{n} Main Street" }
    city "Boston"
    zip_code 12134
    state "Massachusetts"
    url "www.amazon.com"
    img_url "http://i.imgur.com/b5PFYSl.png"
    description "Really cool bookstore"
    food true
  end

  factory :review do
    user
    bookstore
    overall_rating 5
    price_rating 5
    variety_rating 5
    customer_service_rating 5
    food_rating 5
    atmosphere_rating 5
    sequence(:body) { |n| "This is the #{n} bookstore in the world" }
  end
end
