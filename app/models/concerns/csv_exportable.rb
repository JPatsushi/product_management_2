require 'csv'

module CsvExportable
  extend ActiveSupport::Concern

  module ClassMethods
    def to_csv(header: column_names, columns: column_names, encoding: Encoding::CP932)#\nだけでもOK
      
      records = CSV.generate do |csv|
        
        csv << header
        #productの
        all.each do |record| 
          csv << record.attributes.values_at(*columns)
        end
      end
      records.encode(encoding, invalid: :replace, undef: :replace)
    end
  end
end