class ChangeZipCodeToString < ActiveRecord::Migration[5.0]
  def up
    remove_column :bookstores, :zip_code, :integer
    add_column :bookstores, :zip_code, :string, null: false
  end

  def down
    remove_column :bookstores, :zip_code, :string
    add_column :bookstores, :zip_code, :integer, null: false
  end
end
