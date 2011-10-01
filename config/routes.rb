Rails.application.routes.draw do
  
  resources :make_an_offer, :only => :create

  namespace :admin do 
    resources :offers
  end

  match 'admin/offers/accepted/:offer_id' => 'admin/offers#accepted', :as => :accepted_admin_offers 
  match 'admin/offers/rejected/:offer_id' => 'admin/offers#rejected', :as => :rejected_admin_offers

end
