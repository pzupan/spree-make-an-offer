class Admin::OffersController < Admin::BaseController
  resource_controller

  def index
    @offers = Offer.pending_offers.paginate(:all, 
      :include => :user,
      :order => 'offers.created_at, offers.product_id',
      :page => params[:page])
  end
  
  def accepted
    @offer = Offer.update(params[:offer_id], :accepted_at => Date.today)
    @order = Order.find(:first, 
      :conditions => {:user_id => @offer.user_id, :state => 'in_progress'})
    if @order.nil?
      @order = Order.create(:user_id => @offer.user_id)
    end
    @offer.variant.price = @offer.price
    @order.add_variant(@offer.variant)
    
    @order.update_totals!
    
    OfferMailer.deliver_accepted(@offer)

    redirect_to admin_offers_url
  end
  
  def rejected
    @offer = Offer.update(params[:offer_id], :rejected_at => Date.today)
    OfferMailer.deliver_rejected(@offer)
    redirect_to admin_offers_url
  end
  
  update.response do |wants|
    wants.html { redirect_to collection_url }
  end
    
end