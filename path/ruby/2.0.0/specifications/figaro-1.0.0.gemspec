# -*- encoding: utf-8 -*-
# stub: figaro 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "figaro"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Steve Richert"]
  s.date = "2014-09-17"
  s.description = "Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file"
  s.email = "steve.richert@gmail.com"
  s.executables = ["figaro"]
  s.files = ["bin/figaro"]
  s.homepage = "https://github.com/laserlemon/figaro"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Simple Rails app configuration"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.14"])
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.3"])
    else
      s.add_dependency(%q<thor>, ["~> 0.14"])
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.3"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.14"])
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.3"])
  end
end
