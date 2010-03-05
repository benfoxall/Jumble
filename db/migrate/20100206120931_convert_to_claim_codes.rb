class ConvertToClaimCodes < ActiveRecord::Migration
  def self.up    
    [:items,:causes].each do |t|
      remove_column t, :confirmed
      remove_column t, :email
      remove_column t, :login_hash
      
      #then the new one
      add_column t, :claim_code, :string
    end
  end

  def self.down
    [:items,:causes].each do |t|
      add_column t, :confirmed, :boolean, :default => false
      add_column t, :email, :string
      add_column t, :login_hash, :string
      
      #and the new one
      remove_column t, :claim_code
    end
  end
end
