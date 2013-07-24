class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :picture
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
