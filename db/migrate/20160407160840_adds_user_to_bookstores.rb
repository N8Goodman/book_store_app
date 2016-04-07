class AddsUserToBookstores < ActiveRecord::Migration[5.0]
  def change
    add_column :bookstores, :user_id, :integer, null: false
    add_foreign_key :bookstores, :users
  end
end
