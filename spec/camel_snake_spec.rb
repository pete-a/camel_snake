describe CamelSnake do
  it 'initializes with a hash' do
    hash = {test: 'abc'}
    camel_snake = CamelSnake.new(hash)
    expect(camel_snake.original_hash).to eq hash
  end

  describe 'converting to snake_case' do
    let(:original_hash){{
      firstName: 'Test',
      'lastName' => 'User',
      'multipleCamelCases' => 'test',
      'aKey' => {
        'nestedKey' => 'nested key value'
      }
    }}

    let(:output) {
      CamelSnake.new(original_hash).to_snake_case
    }

    it 'converts snake case symbol keys' do
      expect(output).to have_key :first_name
      expect(output[:first_name]).to eq 'Test'
    end

    it 'traverses the hash tree' do
      expect(output['a_key']).to have_key 'nested_key'
      expect(output['a_key']['nested_key']).to eq 'nested key value'
    end
  end

end
