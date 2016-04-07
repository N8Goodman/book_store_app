FactoryGirl.define do
  sequence :email do |n|
    "bee#{n}@example.com"
  end

  factory :user do
    user_name "bookbee1"
    email
    password "buzzbuzzbuzzzzzzz"
  end
end
