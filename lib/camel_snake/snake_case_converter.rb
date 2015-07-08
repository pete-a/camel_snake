class SnakeCaseConverter
  def initialize(hash)
    @original_hash = hash
  end

  def convert
    new_hash = {}
    @original_hash.keys.each {|key| process_key(key, new_hash)}
    new_hash
  end

  private
  def process_key(key, new_hash)
    if @original_hash[key].is_a? Hash
      new_hash[snake_case(key)] = SnakeCaseConverter.new(@original_hash[key]).convert
    else
      new_hash[snake_case(key)] = @original_hash[key]
    end
  end

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
