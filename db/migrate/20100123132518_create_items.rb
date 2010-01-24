class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.integer :retained_cost
      t.integer :cause_id
      t.integer :id_in_cause
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
