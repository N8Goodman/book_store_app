require 'rails_helper'

  RSpec.describe TwitterClient, type: :model do
    describe "#post_tweet(bookstore)" do

      let!(:twitter_client) { TwitterClient.new }
      let!(:bookstore) do FactoryGirl.create(
        :bookstore,
        name: "Bookstore Awesome",
        city: "Boston",
        state: "Massachusetts")
      end

     it "posts a tweet" do
       VCR.use_cassette 'model/twitter_client' do
         message = "#{bookstore.name}, #{bookstore.city}, #{bookstore.state} "
         message += "was added! Check it out at: "

         message +=  "literalist.herokuapp.com/bookstores/#{bookstore.id}"

         response = twitter_client.post_tweet(message)
         expect(response).to_not eq nil
         expect(response).to be_a(Twitter::Tweet)
         expect(response.text).to include(message)
       end
     end

     it "handles errors in posting tweet and returns nil" do
       VCR.use_cassette 'model/twitter_client_fail' do
         message = "#{bookstore.name}, #{bookstore.city}, #{bookstore.state} "
         message += "was added! Check it out at: "

         message +=  "literalist.herokuapp.com/bookstores/#{bookstore.id}"

         response = twitter_client.post_tweet(message)
         expect(response).to eq nil
       end
     end
   end
  end
