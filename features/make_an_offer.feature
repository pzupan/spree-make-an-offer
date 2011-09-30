Feature: Make an Offer
	In order to make an offer
	As a user
	I want to make an offer from the product page

	Scenario:  User makes an offer
		Given I am on the home page
	    And I sign in as "spree@example.com/password"
  		Then I should be logged in
		Given there is a product with name: "Ruby on Rails Mug"
		When I fill in "Offer Price" with "12.99"
		And I fill in "Offer Expires" with "10/01/2010"
		When I press "make offer"
		Then I should see "Ruby on Rails Mug" within "h1"
		And I should see "Your Current Offer" within "h3"
		
	Scenario:  User not signed in makes an offer
		Given I am on the home page
		And there is a product with name: "Ruby on Rails Mug"
		When I fill in "Offer Price" with "12.99"
		And I fill in "Offer Expires" with "10/01/2010"
		When I press "make offer"
		Then I should see "Error: You must be signed in to make an offer."
		
	Scenario: User lists offers pending
		Given I am on the home page
	    And I sign in as "spree@example.com/password"
		And there is a product with name: "Ruby on Rails Mug"
		When I fill in "Offer Price" with "12.99"
		And I fill in "Offer Expires" with "10/07/2010"
		When I press "make offer"
		Then I should see "Ruby on Rails Mug" within "h1"
		And I follow "My Account"
		Then show me the page
		Then I should see "My Offers" 
		And I should see "Ruby on Rails Mug"
		