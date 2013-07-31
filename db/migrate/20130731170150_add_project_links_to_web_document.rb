class AddProjectLinksToWebDocument < ActiveRecord::Migration
  def change
    add_column :web_documents, :project1_id, :integer
    add_column :web_documents, :project2_id, :integer
    add_column :web_documents, :project3_id, :integer
  end
end
