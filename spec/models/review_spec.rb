require 'rails_helper'

RSpec.describe Review, type: :model do

  it { is_expected.to have_valid(:overall_rating).when("1", "2", "3", "4", "5") }
  it { is_expected.to_not have_valid(:overall_rating).when(nil, "", "6", "0", "-3") }

  it { is_expected.to have_valid(:price_rating).when("1", "2", "3", "4", "5") }
  it { is_expected.to_not have_valid(:price_rating).when(nil, "", "6", "0", "-3") }

  it { is_expected.to have_valid(:variety_rating).when("1", "2", "3", "4", "5") }
  it { is_expected.to_not have_valid(:variety_rating).when(nil, "", "6", "0", "-3") }

  it { is_expected.to have_valid(:customer_service_rating).when("1", "2", "3", "4", "5") }
  it { is_expected.to_not have_valid(:customer_service_rating).when(nil, "", "6", "0", "-3") }

  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :bookstore }
end
