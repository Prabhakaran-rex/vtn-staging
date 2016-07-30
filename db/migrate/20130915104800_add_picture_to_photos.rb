class AddPictureToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :picture, :string
    add_column :photos, :name, :string
    add_column :photos, :asset, :string
  end
end
