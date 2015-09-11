# ActiveRecordDateFormatted

## Installation

Add to your Gemfile: **gem 'active_record_date_formatted'**
 
And that's it. 

Now for every active record model's date attribute, you have two additional methods, for example, if the model is Person and the attribute name is *birthdate*, you get following methods: 
- birthdate_formatted
- birthdate_formatted=(formatted_date)

The formatted methods use **date.formats.default** format.
 
For example for german locale: 

<pre>
de:
  date:
    formats:
      default: "%d.%m.%Y" 

I18n.locale = :de
Person.first.birthdate_formatted   # => "12.04.1981"
Person.first.birthdate_formatted = "24.04.1981"
I18n.locale = :en
Person.first.birthdate_formatted   # => "1981-04-12"
Person.first.birthdate_formatted = "1981-04-24"
</pre>

Now you can use the *_formatted in your views, for example when using date pickers. 

## Licence

This project uses MIT-LICENSE.