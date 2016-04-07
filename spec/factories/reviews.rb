FactoryGirl.define do
  sequence :body do |n|
    "This is the #{n} bookstore in the world"
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
    body
  end
end
