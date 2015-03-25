# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "kick_the_tires"
  spec.version       = '0.0.1'
  spec.authors       = ["Dewayne VanHoozer"]
  spec.email         = ["dvanhoozer@gmail.com"]

  spec.summary       = %q{Provides some basic methods/assertions that are handy for exploring a new ruby library.}
  spec.description   = %q{
    Sometimes when you hear about a new library/gem you just wat to kick the kick_the_tires
    to see what it can do.  Sometimes you start with some REPL example from the authors
      or some sample code or tests that the author has provided.  This little gem allowed_push_host
      you to load up a few basic asserts/refutes/shows to explore the library's objects
      and method results.  When you have finished kicking the tires you may want to take
      the library out for a spin with some functional, application-line code and you
      don't want any of the tiring kicking out to STDOUT.
  }
  spec.homepage      = "http://github.com/MadBomber/kick_the_tires"
  spec.license       = "You want it?  It's yours."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://rubygems.org"
  end

  spec.add_dependency "awesome_print"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
