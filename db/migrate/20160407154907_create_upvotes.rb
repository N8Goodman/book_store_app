class CreateUpvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :upvotes do |t|
      t.belongs_to :review
      t.belongs_to :user
    end
  end
end
