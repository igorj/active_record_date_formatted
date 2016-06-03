require 'active_record_date_formatted/date_format_validator'

# Creates additional instance getter and setter methods for each date attribute with postfix _formatted
# These methods use date string formatted with the current locale.
module ActiveRecordDateFormatted
  module Model

    def inherited(subclass)
      super
      subclass.add_date_formatted_methods unless subclass == ActiveRecord::SchemaMigration || subclass.to_s.ends_with?('Temp') # todo nasty bugfix for temporary migration classes with custom table names
    end  
    
    def add_date_formatted_methods
      self.column_types.each do |attr_name, c|
        if c.type == :date
          attr_accessor "#{attr_name}_formatted"
          validates "#{attr_name}_formatted", "active_record_date_formatted/date_format" => true
          before_save "save_formatted_#{attr_name}"

          define_method "#{attr_name}_formatted" do
            if instance_variable_get("@#{attr_name}_formatted").nil?
              date_value = read_attribute(attr_name)
              date_value.nil? ? nil : date_value.strftime(I18n.t "date.formats.default")
            else
              instance_variable_get("@#{attr_name}_formatted")
            end
          end

          define_method "save_formatted_#{attr_name}" do
            write_attribute(attr_name, self.send("#{attr_name}_formatted").blank? ? nil : Date.strptime(self.send("#{attr_name}_formatted"), I18n.t("date.formats.default")))
          end
        end
      end
    end
  end  
end  

ActiveRecord::Base.extend ActiveRecordDateFormatted::Model

