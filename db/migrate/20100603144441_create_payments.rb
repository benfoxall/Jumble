class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :pay_key
      t.string :aasm_state
      
      t.string :email
      t.string :phone
      t.text :note
      t.string :name
      t.string :address
      t.string :address2
      t.string :town
      t.string :county
      t.string :postcode
      
      # Email
      # Phone
      # Note to seller
      # Name
      # Address
      # ...
      # Town/City
      # County
      # Postal Code
      

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
