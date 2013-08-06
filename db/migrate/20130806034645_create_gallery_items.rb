class CreateGalleryItems < ActiveRecord::Migration
  def change
    create_table :gallery_items do |t|
      t.string :picture
      t.integer :position
    end
  end
end
