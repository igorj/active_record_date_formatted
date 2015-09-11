require 'test_helper'

class ActiveRecordDateFormattedTest < ActiveSupport::TestCase
  def setup
    I18n.locale = :en
    Person.create(birth_date: '1971-02-18')    
  end
    
  test "module defined" do
    assert_kind_of Module, ActiveRecordDateFormatted
  end
  
  test "date_formatted getter" do
    assert_equal '1971-02-18', Person.first.birth_date_formatted
    assert_equal '1971-02-18', Person.first.birth_date.to_s
  end  
  
  test "date_formatted getter_german" do
    I18n.locale = :de
    assert_equal '18.02.1971', Person.first.birth_date_formatted
    assert_equal '1971-02-18', Person.first.birth_date.to_s
  end 
  
  test "date_formatted setter_german" do
    I18n.locale = :de
    p = Person.first
    p.birth_date_formatted = "24.02.1971"
    p.save!
    assert_equal '24.02.1971', Person.first.birth_date_formatted
    assert_equal '1971-02-24', Person.first.birth_date.to_s   
  end  
end


