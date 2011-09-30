class Admin::OffersController < Admin::BaseController
  resource_controller

  def index
    @offers = Offers.pending_offers.paginate(:all, 
      :order => 'created_at, product_id',
      :include => [:user, :product],
      :page => params[:page])
  end
  
  def accepted
    @offer = Offers.update(params[:offer_id], :accepted_at => Date.today)
    @order = Order.find(:first, 
      :conditions => {:user_id => @offer.user_id, :state => 'in_progress'})
    if @order.nil?
      @order = Order.new
      @order.user_id = @offer.user_id
      @order.save
    end
    @offer.variant.price = @offer.price
    @order.add_variant(@offer.variant)
    
    @order.update_totals!
    
    OffersMailer.deliver_accepted(@offer)

    redirect_to admin_offers_url
  end
  
  def rejected
    @offer = Offers.update(params[:offer_id], :rejected_at => Date.today)
    OffersMailer.deliver_rejected(@offer)
    redirect_to admin_offers_url
  end
  
  update.response do |wants|
    wants.html { redirect_to collection_url }
  end
    
end