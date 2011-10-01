Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_make_an_offer'
  s.version     = '0.2.0'
  s.summary     = 'Adds a Make An Offer button to the product page of Spree.'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Paul Zupan'
  s.email             = 'pzupan@gmail.com'
  s.homepage          = 'https://pzupan@github.com/pzupan/spree-make-an-offer.git'

  s.files        = Dir['CHANGELOG', 'README.markdown', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.60.0')
end