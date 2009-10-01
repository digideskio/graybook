require File.join( File.dirname(__FILE__), '../lib/graybook.rb' )
require File.join( File.dirname(__FILE__), 'test_helper.rb' )
require 'test/unit'
require 'mocha'

class TestGraybookExporterBase < Test::Unit::TestCase

  include TestHelper

  def test_export
    exporter = Graybook::Exporter::Base.new
    contacts = [{ :name => 'Test', :email => 'test@domain.com' }]
    assert_equal contacts, exporter.export(contacts)
  end

end
