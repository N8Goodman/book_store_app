class AddIndexToReviews < ActiveRecord::Migration[5.0]
  def change
    add_index :reviews, [:user_id, :bookstore_id], unique: true, using: :btree
  end
end
