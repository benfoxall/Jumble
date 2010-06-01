class CreateConversations < ActiveRecord::Migration
  def self.up
    create_table :conversations do |t|
      t.string :path
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :conversations
  end
end
