
Given /^there is a product with (.*?)?$/ do |captured_fields|
  fields = {'name' => 'Ruby on Rails Mug', 'count_on_hand' => '10', 'available_on' => "2010-03-06 18:48:21", 'price' => '14.99'}
  captured_fields.split(/,\s+/).each do |field|
    (name, value) = field.split(/:\s*/, 2)
    fields[name] = value.delete('"')
  end
  price = fields.delete('price')
  if Product.master_price_equals(price).count(:conditions => fields) == 0
    Factory(:product, fields.merge('price' => price))
  end
  When %{I go to the products page}
  Then %{I should see "#{fields['name']}" within "ul.product-listing"}
  When %{I follow "#{fields['name']}"}
  Then %{I should see "#{fields['name']}" within "h1"}
  And  %{I should see "$#{price}" within "span.price"}
end
