require 'rexml/document'

##
# exports contacts in xml format

class Graybook::Exporter::Xml < Graybook::Exporter::Base

  ##
  # contacts are an array of hashes that are contacts and returns xml

  def export( contacts )
    doc = REXML::Document.new
    doc << REXML::XMLDecl.new
    
    root = doc.add_element 'contacts'
    contacts.each do |contact|
      el = root.add_element 'contact'
      name = el.add_element 'name' 
      name.text = contact[:name]
      
      el.add_element('email').text = contact[:email]
    end
    
    doc.to_s
  end
  
  Graybook.register(:xml, self)
end
