class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column(:bookstores, :created_at, :datetime, null: false)
    add_column(:bookstores, :updated_at, :datetime, null: false)
    add_column(:reviews, :created_at, :datetime, null: false)
    add_column(:reviews, :updated_at, :datetime, null: false)
  end
end
