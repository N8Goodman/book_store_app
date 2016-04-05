class CreateBookstores < ActiveRecord::Migration[5.0]
  def change
    create_table :bookstores do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip_code, null: false
      t.string :url
      t.string :img_url
      t.string :description
      t.boolean :beverage
      t.boolean :food
    end
  end
end
