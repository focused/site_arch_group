class CreateWebDocuments < ActiveRecord::Migration
  def change
    create_table :web_documents do |t|
      t.string :title
      t.string :alias_name
      t.integer :position

      t.timestamps
    end
  end
end
