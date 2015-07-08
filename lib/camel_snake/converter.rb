class Converter
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
      new_hash[convert_case(key)] = self.class.new(@original_hash[key]).convert
    else
      new_hash[convert_case(key)] = @original_hash[key]
    end
  end

  def convert_case(key, force_symbols = false)
    raise 'Abstract Method'
  end

end
