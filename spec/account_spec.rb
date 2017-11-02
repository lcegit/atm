require './lib/account.rb'

describe Account do

let(:person) { instance_double('Person', name: 'Thomas')}

  it 'check length of a number' do
    number = 1234
    pin_code_length = Math.log10(number).to_i + 1
    expect(pin_code_length).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to have :active status on initialize'
    expect(subject.account_status).to eq :active
  end

  it 'deactivates account using Instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end

  
