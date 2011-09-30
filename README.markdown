Make An Offer
============

This extension adds a Make An Offer button to the product page of Spree.  It accepts an offer price and an expiration date.  On submission, an email is sent to the site order email.  The extension also adds an Admin feature allowing the site administrator to accept or reject the offer.  If accepted, the product is added to the user's cart at the offer price. Check out then happens normally. 
 
Installation
============

1. Install Spree (Requires 0.11.0 or greater).

2. Install this extension

      script/extension install git://github.com/pzupan/spree-make-an_offer.git

3. Run pending migrations

      rake db:migrate

Additional Notes
================

Currently this extension adds the Make An Offer button to every product.  The intent is to create a default of all products or the ability to select specific products which will accept an offer. This extension is currently in production on one site.  