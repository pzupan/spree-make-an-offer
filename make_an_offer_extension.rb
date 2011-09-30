# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class MakeAnOfferExtension < Spree::Extension
  version "0.1.0"
  description "Add a Make an Offer button to product"
  url "http://yourwebsite.com"

  # Please use make_an_offer/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
       
    User.class_eval do 
      has_many :offers
    end
    
    Product.class_eval do
      has_many :offers
    end

    LineItem.class_eval do
      has_many :offers
    end

    ProductsController.class_eval do
      helper :make_an_offer
      def show
        if !current_user.nil?
          @offer = Offers.user_offers(current_user.id).product_offers(@product.id).pending_offers.find(:first)
        end
        @previous = Offers.find(:first, 
          :order => 'price DESC',
          :conditions => {:product_id => @product.id})
        if @offer == nil
          @offer = Offers.new
          @offer.price = 0.00
          @offer_expires_at = (Date.today + 5).strftime('%m/%d/%Y')
        else
          # named_scopes returns :all, select :first
          @offer_expires_at = @offer.expires_at.strftime('%m/%d/%Y')
        end
      end
    end

    UsersController.class_eval do
      helper :products
      def show_before
        @orders = @user.orders.checkout_complete
        @offers = Offers.user_offers(@user.id).pending_offers.find(:all, :include => :product)      
      end
    end
  
    Admin::ConfigurationsController.class_eval do
      before_filter :add_offers_link, :only => :index
 
      def add_offers_link
        @extension_links << {:link => admin_offers_url, :link_text => t('offers'), :description => t('offers_description')}
      end
    end
  end
end
