class Bookstore < ActiveRecord::Base
  STATES = [
    ["Alaska", "AK"],
    ["Alabama", "AL"],
    ["Arkansas", "AR"],
    ["American Samoa", "AS"],
    ["Arizona", "AZ"],
    ["California", "CA"],
    ["Colorado", "CO"],
    ["Connecticut", "CT"],
    ["District of Columbia", "DC"],
    ["Delaware", "DE"],
    ["Florida", "FL"],
    ["Georgia", "GA"],
    ["Guam", "GU"],
    ["Hawaii", "HI"],
    ["Iowa", "IA"],
    ["Idaho", "ID"],
    ["Illinois", "IL"],
    ["Indiana", "IN"],
    ["Kansas", "KS"],
    ["Kentucky", "KY"],
    ["Louisiana", "LA"],
    ["Massachusetts", "MA"],
    ["Maryland", "MD"],
    ["Maine", "ME"],
    ["Michigan", "MI"],
    ["Minnesota", "MN"],
    ["Missouri", "MO"],
    ["Mississippi", "MS"],
    ["Montana", "MT"],
    ["North Carolina", "NC"],
    ["North Dakota", "ND"],
    ["Nebraska", "NE"],
    ["New Hampshire", "NH"],
    ["New Jersey", "NJ"],
    ["New Mexico", "NM"],
    ["Nevada", "NV"],
    ["New York", "NY"],
    ["Ohio", "OH"],
    ["Oklahoma", "OK"],
    ["Oregon", "OR"],
    ["Pennsylvania", "PA"],
    ["Puerto Rico", "PR"],
    ["Rhode Island", "RI"],
    ["South Carolina", "SC"],
    ["South Dakota", "SD"],
    ["Tennessee", "TN"],
    ["Texas", "TX"],
    ["Utah", "UT"],
    ["Virginia", "VA"],
    ["Virgin Islands", "VI"],
    ["Vermont", "VT"],
    ["Washington", "WA"],
    ["Wisconsin", "WI"],
    ["West Virginia", "WV"],
    ["Wyoming", "WY"]
  ]
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, numericality: true, length: { is: 5 }
  validates :user, presence: true
  validates :name, uniqueness: { scope: [:address, :city, :state], message: "already exists for this address" }

  def self.search(search)
    if search
      where('name iLIKE ?', "%#{search}%")
    else
      Bookstore.all
    end
  end

  def tweet
    twitter_client.update("#{name}, #{city}, #{state} was just added! Check it out at: https://www.literalist.herokuapp.com/bookstores")
  end

  private

  def twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["YOUR_CONSUMER_KEY"]
      config.consumer_secret = ENV["YOUR_CONSUMER_SECRET"]
      config.access_token = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end
    client
  end
end
