class AddUserIdToCauses < ActiveRecord::Migration
  def self.up
    add_column :causes, :user_id, :integer
    add_column :items, :user_id, :integer
    remove_column :causes, :owner_id
  end

  def self.down
    remove_column :causes, :user_id
    remove_column :items, :user_id
    add_column :causes, :owner_id, :integer
  end
end
