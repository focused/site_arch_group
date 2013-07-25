class AddDoubleToProjectItems < ActiveRecord::Migration
  def change
    add_column :project_items, :double, :boolean, default: false
  end
end
