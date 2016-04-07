FactoryGirl.define do

  sequence :address do |n|
    "#{n} Main Street"
  end
  sequence :name do |n|
    "Book Store #{n}"
  end

  factory :bookstore do
    name
    address
    city "Boston"
    zip_code 12134
    state "Massachusetts"
    url "www.amazon.com"
    img_url "http://i.imgur.com/b5PFYSl.png"
    description "Really cool bookstore"
    food true
    association :user, factory: :user
  end
end
