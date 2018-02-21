require 'rpn/version'

Gem::Specification.new do |spec|
  spec.name          = 'rpn'
  spec.version       = Rpn::VERSION
  spec.authors       = ['Ryan Pitts']
  spec.email         = ['ryanpitts1@gmail.com']

  spec.summary       = 'This is a simple RPN (Reverse Polish Notation) gem.'
  spec.description   = 'This gem can do the four basic operators.'
  spec.homepage      = 'https://rubygems.org/gems/rpn.'
  spec.license       = 'MIT'

  spec.executables   = ['rpn']
  spec.files         = Dir.glob('{bin,lib}/**/*.rb')

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-command', '~> 1.0'
end
