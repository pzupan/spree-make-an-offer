module Admin::OffersHelper
  def offer_status(offer)
    case
    when !offer.product.has_stock?  
      t("out_of_stock")
    when !offer.rejected_at.nil?
      t("rejected") + " " + offer.rejected_at.strftime("%m/%d/%Y")
    when !offer.accepted_at.nil?
      t("accepted") + " " + offer.accepted_at.strftime("%m/%d/%Y")
    else
      link_to_with_icon('accept', t("accept"), accepted_admin_offers_path(offer.id)) + ' | ' + link_to_with_icon('delete', t("reject"), rejected_admin_offers_path(offer.id))
    end 
  end
end
