require "camel_snake/version"

module CamelSnake
  def self.new(hash)
    CamelSnake.new(hash)
  end

  class CamelSnake
    attr_reader :original_hash

    def initialize(hash)
      @original_hash = hash
    end

    def to_snake_case
      new_hash = {}
      @original_hash.keys.each do |key|
        new_hash[snake_case(key, true)] = @original_hash[key]
      end
      new_hash
    end

    private
    def snake_case(value, force_symbols = false)
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
end
