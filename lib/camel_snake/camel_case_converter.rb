class CamelCaseConverter
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
      new_hash[camel_case(key)] = CamelCaseConverter.new(@original_hash[key]).convert
    else
      new_hash[camel_case(key)] = @original_hash[key]
    end
  end

  def camel_case(value, force_symbols = false)
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
