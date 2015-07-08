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

    it 'converts snake case string keys' do
      expect(output).to have_key 'last_name'
      expect(output['last_name']).to eq 'User'
    end

    it 'traverses the hash tree' do
      expect(output['a_key']).to have_key 'nested_key'
      expect(output['a_key']['nested_key']).to eq 'nested key value'
    end
  end

  describe 'converting to camelCase' do
    let(:original_hash){{
      first_name: 'Test',
      'last_name' => 'User',
      'multiple_snake_cases' => 'test',
      'a_key' => {
        'nested_key' => 'nested key value'
      }
    }}

    let(:output) {
      CamelSnake.new(original_hash).to_camel_case
    }

    it 'converts camel case symbol keys' do
      expect(output).to have_key :firstName
      expect(output[:firstName]).to eq 'Test'
    end

    it 'converts camel case string keys' do
      expect(output).to have_key 'lastName'
      expect(output['lastName']).to eq 'User'
    end

    it 'traverses the hash tree' do
      expect(output['aKey']).to have_key 'nestedKey'
      expect(output['aKey']['nestedKey']).to eq 'nested key value'
    end
  end
end
