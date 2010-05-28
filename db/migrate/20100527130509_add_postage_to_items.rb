class AddPostageToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :postage, :integer, :default => 0
  end

  def self.down
    remove_column :items, :postage
  end
end
