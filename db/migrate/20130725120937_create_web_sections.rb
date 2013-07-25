class CreateWebSections < ActiveRecord::Migration
  def change
    create_table :web_sections do |t|
      t.string :alias_name
      t.text :content
      t.integer :position
      t.references :web_document, index: true
    end
  end
end
