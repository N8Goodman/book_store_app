require 'rails_helper'

RSpec.describe Downvote, type: :model do

  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :review }

end
