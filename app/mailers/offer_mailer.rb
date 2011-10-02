class OfferMailer < ActionMailer::Base
  helper "spree/base"
  
  def pending(offer)
    @subject    = '[PENDING OFFER] ' + Spree::Config[:site_name] + ' - ' + offer.product.name
    @recipients = Spree::Config[:order_from]
    @from       = Spree::Config[:order_from]
    @sent_on    = Time.now
    @body       = {:offer => offer}
  end
  
  def rejected(offer)
    @subject    = Spree::Config[:site_name] + ' has rejected your offer on #' + offer.product.name
    @recipients = offer.user.email
    @from       = Spree::Config[:order_from]
    @bcc        = order_bcc
    @sent_on    = Time.now
    @body       = {:offer => offer}
  end  
  
  def accepted(offer)
    @subject    = Spree::Config[:site_name] + ' has accepted your offer on #' + offer.product.name
    @recipients = offer.user.email
    @from       = Spree::Config[:order_from]
    @bcc        = order_bcc
    @sent_on    = Time.now
    @body       = {:offer => offer}
  end  

  private
  def order_bcc
      bcc = [Spree::Config[:order_bcc] || "", Spree::Config[:mail_bcc] || ""]
      bcc = bcc.inject([]){|array, config_string| array + config_string.split(",")}
      bcc = bcc.collect{|email| email.strip}
      bcc = bcc.uniq
      bcc
  end
end
