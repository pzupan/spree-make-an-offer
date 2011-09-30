class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :user_id
      t.integer :product_id 
      t.integer :variant_id
      t.decimal  :price, :precision => 8, :scale => 2, :null => false
      t.datetime :expires_at
      t.datetime :accepted_at
      t.datetime :rejected_at
      t.text :comment
      t.timestamps
    end
    add_index(:offers, :id)
    add_index(:offers, :user_id)
    add_index(:offers, :product_id)
    add_index(:offers, :expires_at)
  end

  def self.down
    drop_table :offers
  end
end
