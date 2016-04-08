require 'rails_helper'

RSpec.describe Bookstore, type: :model do

  it { is_expected.to have_valid(:name).when("I Am a Bookstore", "WooBook!") }
  it { is_expected.to_not have_valid(:name).when(nil, "") }

  it { is_expected.to have_valid(:address).when("23 Somewhere Road", "Rural Route 4") }
  it { is_expected.to_not have_valid(:address).when(nil, "") }

  it { is_expected.to have_valid(:city).when("Boston", "Austin") }
  it { is_expected.to_not have_valid(:city).when(nil, "") }

  it { is_expected.to have_valid(:state).when("MA", "TX") }
  it { is_expected.to_not have_valid(:state).when(nil, "") }

  it { is_expected.to have_valid(:zip_code).when("01886", "90210") }
  it { is_expected.to_not have_valid(:zip_code).when(nil, "", "Apple", "90876445", "345") }

  it { is_expected.to validate_presence_of :user }
  it { is_expected.to have_many(:reviews).dependent(:destroy) }
end
