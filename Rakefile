# -*- ruby -*-

require 'rubygems'
require 'hoe'
$LOAD_PATH.unshift 'lib'
require 'graybook'

begin
  require 'rcov/rcovtask'
rescue LoadError
end

begin
  Rcov::RcovTask.new do |t|
    t.test_files = FileList['test/test*.rb']
    t.verbose = true
    #t.rcov_opts << "--exclude rcov.rb,hpricot.rb,hpricot/.*\.rb"
  end
rescue NameError
end

require 'rubygems'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name        = "graybook"
    s.summary     = "It does things. Like import contacts from EVERYWHERE."
    s.email       = "kojul@kojul.com"
    s.homepage    = "http://github.com/kojul/gray"
    s.description = "It does things. Like import contacts from EVERYWHERE."
    s.authors     = ["kojul"]
    s.add_dependency('hpricot', '>= 0.7.0')
    s.add_dependency('mechanize', '>= 0.7.0')
    s.add_dependency('hoe', '>= 1.5.0')
    s.add_dependency('fastercsv', '>= 1.2.0')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
