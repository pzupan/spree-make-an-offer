class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :variant

  validates_presence_of :price
  validates_presence_of :expires_at

  named_scope :user_offers, lambda { |user_id|
    {:conditions => {:user_id => user_id}}
  }
  named_scope :product_offers, lambda { |product_id|
    {:conditions => {:product_id => product_id}}
  }
  named_scope :pending_offers, {:conditions => ['offers.expires_at >= "' + Date.today.to_s(:db) + '"']}

end
