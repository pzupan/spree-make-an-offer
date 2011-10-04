Admin::ConfigurationsController.class_eval do

  before_filter :add_offers_link, :only => :index
 
  def add_offers_link
#    @extension_links << {:link => admin_offers_url, :link_text => t('offers'), :description => t('offers_description')}
  end
end
