require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_valid(:user_name).when("Ann", "Ashley", "iamtwentyletterslong") }

  it { should_not have_valid(:user_name).when(nil, "", "am", "iamlongerthantwentylong") }

  it { should have_valid(:email).when('test@test.com', 'test+spam@gmail.com') }
  it { should_not have_valid(:email).when('fail', 123) }

  it { should have_many(:bookstores).dependent(:destroy) }
  it { should have_many(:reviews).dependent(:destroy) }

  describe 'password' do

    before { subject.password_confirmation = 'password' }
    it { should have_valid(:password).when('password') }
    it { should_not have_valid(:password).when(nil) }
  end
end
