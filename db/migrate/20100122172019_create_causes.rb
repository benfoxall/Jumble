class CreateCauses < ActiveRecord::Migration
  def self.up
    create_table :causes do |t|
      t.string :title
      t.text :description
      t.integer :owner_id
      t.string :aasm_state
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :causes
  end
end
