require 'rails_helper'

RSpec.describe TwitterClient, type: :model do
  describe "#post_tweet(bookstore)" do
    let!(:twitter_client) { TwitterClient.new }

    let!(:bookstore) { FactoryGirl.create(
      :bookstore,
      name: "Bookstore Awesome",
      city: "Boston",
      state: "Massachusetts")
    }

    let(:message) do
      "#{bookstore.name}, #{bookstore.city}, #{bookstore.state} " +
        "was added! Check it out at: " +
        "literalist.herokuapp.com/bookstores/#{bookstore.id}"
    end

   it "posts a tweet" do
    VCR.use_cassette 'model/twitter_client' do
      response = twitter_client.post_tweet(message)

      expect(response).to_not eq nil
      expect(response).to be_a(Twitter::Tweet)
      expect(response.text).to include("#{bookstore.name}, #{bookstore.city}, #{bookstore.state} was just added!")
    end
   end

   it "handles errors in posting tweet and returns nil" do
     VCR.use_cassette 'model/twitter_client_fail' do
      response = twitter_client.post_tweet(message)

      expect(response).to eq nil
     end
   end
  end
end
