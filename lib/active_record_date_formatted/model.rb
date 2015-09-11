# Creates additional instance getter and setter methods for each date attribute with postfix _formatted
# These methods use date string formatted with the current locale.
module ActiveRecordDateFormatted
  module Model

    def inherited(subclass)
      super
      subclass.add_date_formatted_methods
    end  
    
    def add_date_formatted_methods
      self.column_types.each do |attr_name, c|
        if c.type == :date
          define_method "#{attr_name}_formatted" do
            date_value = read_attribute(attr_name)
            date_value.nil? ? nil : date_value.strftime(I18n.t "date.formats.default")
          end

          define_method "#{attr_name}_formatted=" do |date_formatted|
            write_attribute(attr_name, date_formatted.blank? ? nil : Date.strptime(date_formatted, I18n.t("date.formats.default")))
          end
        end
      end
    end
  end  
end  

ActiveRecord::Base.extend ActiveRecordDateFormatted::Model

