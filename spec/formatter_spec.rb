require_relative '../formatter'

RSpec.describe Formatter::PhoneNumber do
  it 'raises an error if number is not correct length for UK numbers' do
    expect { Formatter::PhoneNumber::UK.format('0712345678') }.to raise_error(Formatter::PhoneNumber::InvalidNumberLength)
  end

  it 'raises an error if prefix is incorrect for UK numbers' do
    expect { Formatter::PhoneNumber::UK.format('27123456789') }.to raise_error(Formatter::PhoneNumber::InvalidPrefix)
  end

  it 'raises an error if number input is not in valid UK format' do
    expect { raise '071234 5678' }.to raise_error(StandardError)
  end

  describe "#format" do
    it 'returns the correct format for a number starting with 07' do
      expect(Formatter::PhoneNumber::UK.format('07123456789')).to eq('+447123456789')
    end

    it 'returns the correct format for a number starting with 447' do
      expect(Formatter::PhoneNumber::UK.format('447123456789')).to eq('+447123456789')
    end

    it 'should get rid of all white spaces and return correct format' do
      expect(Formatter::PhoneNumber::UK.format('44 71 23 456 789')).to eq('+447123456789')
    end

    it 'if the number already in correect number, should not change format' do
      expect(Formatter::PhoneNumber::UK.format('+447123456789')).to eq('+447123456789')
    end
  end
end
