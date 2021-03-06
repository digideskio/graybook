# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{graybook}
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["kojul", "Contentfree"]
  s.date = %q{2009-10-26}
  s.description = %q{Graybook is used to import email contact lists from popular webmail sites. Currently supported are AOL/AIM, Yahoo, Hotmail/Live/MSN, and Google Mail (although not Google Apps Mail yet).}
  s.email = %q{kojul@kojul.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG",
     "README",
     "Rakefile",
     "VERSION",
     "VERSION.yml",
     "VERSION_NAME",
     "init.rb",
     "lib/graybook.rb",
     "lib/graybook/exporter/base.rb",
     "lib/graybook/importer/aol.rb",
     "lib/graybook/importer/base.rb",
     "lib/graybook/importer/gmail.rb",
     "lib/graybook/importer/hotmail.rb",
     "lib/graybook/importer/page_scraper.rb",
     "lib/graybook/importer/yahoo.rb",
     "updater.rb"
  ]
  s.homepage = %q{http://github.com/kojul/gray}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{It does things. Like import contacts from EVERYWHERE. (Some sites may be excluded)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.7.0"])
      s.add_runtime_dependency(%q<mechanize>, [">= 0.7.0"])
      s.add_runtime_dependency(%q<fastercsv>, [">= 1.2.0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.7.0"])
      s.add_dependency(%q<mechanize>, [">= 0.7.0"])
      s.add_dependency(%q<fastercsv>, [">= 1.2.0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.7.0"])
    s.add_dependency(%q<mechanize>, [">= 0.7.0"])
    s.add_dependency(%q<fastercsv>, [">= 1.2.0"])
  end
end
