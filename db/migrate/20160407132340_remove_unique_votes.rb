class RemoveUniqueVotes < ActiveRecord::Migration[5.0]
  def up
    remove_index :votes, [:user_id, :review_id]
  end
  
  def down
    add_index :votes, [:user_id, :review_id], unique: true, using: :btree
  end
end
