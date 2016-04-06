class AddIndexForBookstoresOnNameAddressCity < ActiveRecord::Migration[5.0]
  def change
    add_index :bookstores, [:name, :address, :city], unique: true, using: :btree
  end
end
