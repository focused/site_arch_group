class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :position
      t.string :picture

      t.timestamps
    end
  end
end
