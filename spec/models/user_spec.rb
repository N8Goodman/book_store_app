require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_valid(:user_name).when("Ann", "Ashley", "iamtwentyletterslong") }

  it { is_expected.to_not have_valid(:user_name).when(nil, "", "am", "iamlongerthantwentylong") }

  it { is_expected.to have_valid(:email).when('test@test.com', 'test+spam@gmail.com') }
  it { is_expected.to_not have_valid(:email).when('fail', 123) }

  it { is_expected.to have_valid(:password).when('IamaPAssword') }
  it { is_expected.to_not have_valid(:password).when(nil, "", "small") }

  it { is_expected.to have_many(:bookstores).dependent(:destroy) }
  it { is_expected.to have_many(:reviews).dependent(:destroy) }

  describe 'password' do

    before { subject.password_confirmation = 'password' }
    it { is_expected.to have_valid(:password).when('password') }
    it { is_expected.to_not have_valid(:password).when(nil) }
  end
end
