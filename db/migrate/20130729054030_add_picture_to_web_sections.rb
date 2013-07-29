class AddPictureToWebSections < ActiveRecord::Migration
  def change
    add_column :web_sections, :picture, :string
  end
end
