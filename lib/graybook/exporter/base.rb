##
# base class for exporters of contact information

module Graybook::Exporter

  class Base
    ##
    # Override this to convert +contacts+ (an array of hashes) to something more useful. Here, it
    # just returns Graybook's internal format
    def export( contacts )
      contacts
    end
    
    Graybook.register :basic, self
  end
end
