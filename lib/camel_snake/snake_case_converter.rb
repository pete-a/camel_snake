require 'camel_snake/converter'

class SnakeCaseConverter < Converter
  def convert_case(value, force_symbols = false)
    snake_case_value = value.to_s.gsub(/([a-z])([A-Z])/) { |m|
      "#{$1.downcase}_#{$2.downcase}"
    }
    if (value.is_a? Symbol) || force_symbols
      snake_case_value.to_sym
    else
      snake_case_value
    end
  end
end
