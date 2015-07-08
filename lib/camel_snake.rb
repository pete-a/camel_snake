require "camel_snake/version"
require 'camel_snake/snake_case_converter'

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
      SnakeCaseConverter.new(@original_hash).convert
    end
  end
end
