class CreateModifyIndex < ActiveRecord::Migration[5.0]
  def change
      remove_index :bookstores, column: [:name, :address, :city]

      add_index :bookstores, [:name, :address, :city, :state], unique: true, :name => 'by_name_and_full_address'
  end
end
