class AddPictureToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :picture, :string
    add_column :projects, :vertical, :boolean, default: false
  end
end
