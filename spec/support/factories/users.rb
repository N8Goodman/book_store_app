FactoryGirl.define do
  sequence :email do |n|
    "bee#{n}@example.com"
  end

  sequence :user_name do |n|
    "bookbee#{n}"
  end

  factory :user do
    user_name
    email
    password "buzzbuzzbuzzzzzzz"
    admin "false"
  end
end
