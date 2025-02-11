lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "standard_http_status/version"

Gem::Specification.new do |spec|
  spec.name          = "standard_http_status"
  spec.version       = StandardHttpStatus::VERSION
  spec.authors       = ["Touqeer-tqr"]
  spec.email         = ["tqr093@gmail.com"]

  spec.summary       = %q{A simple to get standard http status and http errors}
  spec.description   = %q{A simple to get standard http status and http errors. It can be used for API response with format :json or :xml}
  spec.homepage      = "https://github.com/Touqeer-tqr/standard_http_status/blob/master/README.md"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.required_ruby_version = '>= 2.5.0'

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/gems/standard_http_status"
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Touqeer-tqr/standard_http_status"
    spec.metadata["changelog_uri"] = "https://github.com/Touqeer-tqr/standard_http_status/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.5 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">=1.17"
  spec.add_development_dependency "rake", ">=10.0"
  spec.add_development_dependency "rspec", ">=3.0"
  spec.add_development_dependency "json"
  spec.add_development_dependency "gyoku"
end
