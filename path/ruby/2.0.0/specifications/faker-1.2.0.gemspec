# -*- encoding: utf-8 -*-
# stub: faker 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "faker"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Benjamin Curtis"]
  s.date = "2013-07-27"
  s.description = "Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc."
  s.email = ["benjamin.curtis@gmail.com"]
  s.homepage = "http://faker.rubyforge.org"
  s.rubyforge_project = "faker"
  s.rubygems_version = "2.2.2"
  s.summary = "Easily generate fake data"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, ["~> 0.5"])
    else
      s.add_dependency(%q<i18n>, ["~> 0.5"])
    end
  else
    s.add_dependency(%q<i18n>, ["~> 0.5"])
  end
end
