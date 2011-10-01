class SpreeMakeAnOfferHooks < Spree::ThemeSupport::HookListener

  insert_after :cart_form, 'products/offers'
  
  insert_after :account_my_orders, 'users/my_offers'
  
    # adding new tab to the admin navigation
  insert_after :admin_tabs do
    '<%= tab :offers %>'
  end

  
end
