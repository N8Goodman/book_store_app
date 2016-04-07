class DeleteVotes < ActiveRecord::Migration[5.0]
  def up
    drop_table :votes
  end

  def down
    create_table :votes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false
      t.string :vote, null: false
    end
  end
end
