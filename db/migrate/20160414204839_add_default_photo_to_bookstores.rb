class AddDefaultPhotoToBookstores < ActiveRecord::Migration[5.0]
  def up
    remove_column :bookstores, :img_url
    add_column :bookstores, :img_url, :string, default: "https://pbs.twimg.com/profile_images/730703875/twitter5.jpg"
  end

  def down
  remove_column :bookstores, :img_url
  add_column :bookstores, :img_url, :string
  end
end
