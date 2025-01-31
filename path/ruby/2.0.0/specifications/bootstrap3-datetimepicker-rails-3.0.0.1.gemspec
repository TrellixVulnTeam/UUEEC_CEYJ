# -*- encoding: utf-8 -*-
# stub: bootstrap3-datetimepicker-rails 3.0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap3-datetimepicker-rails"
  s.version = "3.0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Trevor Strieber"]
  s.date = "2014-06-04"
  s.description = "This gem packages the Bootstrap3 bootstrap-datetimepicker (JS & CSS) for Rails 3.1+ asset pipeline."
  s.email = ["trevor@strieber.org"]
  s.homepage = "http://github.com/TrevorS/bootstrap3-datetimepicker-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Bootstrap3 bootstrap-datetimepicker's JS & CSS for Rails 3.1+ asset pipeline."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<momentjs-rails>, ["~> 2.5.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<momentjs-rails>, ["~> 2.5.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<momentjs-rails>, ["~> 2.5.0"])
  end
end
