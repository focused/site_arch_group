class AddFinishedAndImportantToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :finished, :boolean, default: false
    add_column :projects, :important, :boolean, default: false
  end
end
