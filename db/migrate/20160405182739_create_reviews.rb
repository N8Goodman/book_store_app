class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, null: false
      t.belongs_to :bookstore, null: false
      t.integer :overall_rating, null: false
      t.integer :price_rating, null: false
      t.integer :variety_rating, null: false
      t.integer :customer_service_rating, null: false
      t.integer :beverage_rating
      t.integer :food_rating
      t.integer :atmosphere_rating
      t.text :body
    end
  end
end
