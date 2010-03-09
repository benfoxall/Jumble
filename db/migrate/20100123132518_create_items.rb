class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      
      t.integer :cause_id
      t.integer :user_id
      
      t.string :title
      t.integer :price
      t.integer :donation
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
