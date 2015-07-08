require 'camel_snake/converter'

class CamelCaseConverter < Converter
  def convert_case(value, force_symbols = false)
    camel_case_value = value.to_s.gsub(/_([a-zA-Z])/) { |m|
      "#{$1.upcase}"
    }
    if (value.is_a? Symbol) || force_symbols
      camel_case_value.to_sym
    else
      camel_case_value
    end
  end
end
