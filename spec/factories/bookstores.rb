FactoryGirl.define do

  factory :bookstore do
    name "Literati"
    address "23 Somewhere Avenue"
    city "Anytown"
    state "MA"
    zip_code "02111"
    association :user, factory: :user
  end
end
