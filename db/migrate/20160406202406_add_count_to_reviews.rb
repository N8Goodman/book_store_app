class AddCountToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :count, :integer, null: false, default: 0
  end
end
