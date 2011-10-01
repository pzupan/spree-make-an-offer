UsersController.class_eval do
  
  helper :products
  
  def show_before
    @orders = @user.orders.checkout_complete
    @offers = Offer.user_offers(@user.id).pending_offers.find(:all, :include => :product)      
  end

end
