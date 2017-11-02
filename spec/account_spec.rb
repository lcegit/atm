require './lib/account_spec.rb'

describe Account do

  it 'has $1000 upon initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'check length of a number' do
    number = 1234
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

end
