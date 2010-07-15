module MakeAnOfferHelper
  def offer_status(offer)
    case
    when !offer.rejected_at.nil?
      content_tag(:h3, t("rejected") + " " + offer.rejected_at.strftime("%m/%d/%Y"), :style => "color:#cc3300")
      
    when !offer.accepted_at.nil?
      content_tag(:h3, t("accepted") + " " + offer.accepted_at.strftime("%m/%d/%Y"), :style => "color:#cc3300")

    else
      t('notified_by_email_on_acceptance') 
    end 
  end
end
