class CreateArticleItems < ActiveRecord::Migration
  def change
    create_table :article_items do |t|
      t.string :picture
      t.references :article, index: true
      t.integer :position
    end
  end
end
