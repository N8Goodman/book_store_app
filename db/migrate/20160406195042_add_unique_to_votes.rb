class AddUniqueToVotes < ActiveRecord::Migration[5.0]
  def change
    add_index :votes, [:user_id, :review_id], unique: true, using: :btree
  end
end
