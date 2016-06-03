module ActiveRecordDateFormatted
  class DateFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return false if value.blank?
      begin
        Date.strptime(value, I18n.t("date.formats.default"))
      rescue ArgumentError
        record.errors[attribute] << :invalid
      end
    end
  end
end