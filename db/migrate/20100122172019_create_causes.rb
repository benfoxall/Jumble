class CreateCauses < ActiveRecord::Migration
  def self.up
    create_table :causes do |t|
      
      t.integer :user_id
      
      t.string :title
      t.text :description
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :causes
  end
end
