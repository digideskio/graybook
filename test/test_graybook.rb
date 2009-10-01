require File.join( File.dirname(__FILE__), '../lib/graybook.rb' )
require File.join( File.dirname(__FILE__), 'test_helper.rb' )
require 'test/unit'
require 'mocha'

class TestGraybook < Test::Unit::TestCase

  include TestHelper

  def test_class_get
    Graybook.any_instance.expects(:get)
    Graybook.get
  end

  def test_class_instance
    assert Graybook.instance.is_a?(Graybook)
  end

  def test_class_register
    Graybook.register(:base, Graybook::Exporter::Base)
    assert Graybook.instance.exporters[:base].is_a?(Graybook::Exporter::Base)
    
    Graybook.register(:base, Graybook::Importer::Base)
    assert Graybook.instance.importers[:base].is_a?(Graybook::Importer::Base)
  end

  def test_class_register_raises_on_bad_register
    assert_raises(ArgumentError) do
      Graybook.register(:bad, String)
    end
  end

  def test_export
    importer = Graybook::Importer::Base.new
    exporter = Graybook::Exporter::Base.new
    importer.expects(:import)
    exporter.expects(:export)
    Graybook.instance.export( importer, exporter, {} )
  end

  def test_find_importer
    base = Graybook::Importer::Base.new
    base.stubs(:=~).returns(true)
    Graybook.any_instance.stubs(:importers).returns({:basic => base})
    assert_equal base, Graybook.instance.find_importer(:as => :basic)
    
    base.stubs(:=~).returns(false)
    assert_nil Graybook.instance.find_importer(:as => :basic)
  end

  def test_get
    cards = Graybook.instance.get( :csv, :file => fixture_file('gmail.csv') )
    assert_equal 2, cards.size
    assert cards.detect{|card| card[:name] == "Joe User"}
    assert cards.detect{|card| card[:name] == "Some Guy"}
    assert cards.detect{|card| card[:email] == "joeuser@example.com"}
    assert cards.detect{|card| card[:email] == "someguy@example.com"}
  end
  
end
