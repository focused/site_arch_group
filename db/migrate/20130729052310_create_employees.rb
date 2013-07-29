class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :post
      t.string :photo
      t.integer :position

      t.timestamps
    end
  end
end
