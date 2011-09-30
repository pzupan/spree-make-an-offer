# Put your extension routes here.

# map.namespace :admin do |admin|
#   admin.resources :whatever
# end  

map.resources :make_an_offer, :only => [:create]

map.namespace :admin do |admin|
  admin.resources :offers
end

map.accepted_admin_offers 'admin/offers/accepted/:offer_id', :controller => 'admin/offers', :action => 'accepted'
map.rejected_admin_offers 'admin/offers/rejected/:offer_id', :controller => 'admin/offers', :action => 'rejected'
