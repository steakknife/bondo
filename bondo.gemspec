$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'bondo/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'bondo'
  s.version     = Bondo::VERSION
  s.authors     = ['Barry Allard']
  s.email       = ['barry.allard@gmail.com']
  s.homepage    = 'https://github.com/steakknife/bondo'
  s.summary     = 'Deterministic, composite Ruby objects'
  s.description = 'Sensible composite Ruby objects'

  s.files = Dir['lib/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']
  s.require_path = 'lib'
  s.license      = 'MIT'

  s.add_development_dependency 'rake'
end
.tap {|gem| pk = File.expand_path(File.join('~/.keys', 'gem-private_key.pem')); gem.signing_key = pk if File.exist? pk; gem.cert_chain = ['gem-public_cert.pem']} # pressed firmly by waxseal
