require './lib/atm.rb'

describe Atm do
  let(:account) { instance_double('Account', pin_code: '1234', exp_date: '12/17', account_status: :active) }

  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end

  it 'has $1000 upon initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at withdraw' do
    subject.withdraw('1234', 50, account)
    expect(subject.funds).to eq 950
  end

  it 'allow withdraw if account has enough balance.' do
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
    expect(subject.withdraw('1234', 45, account)).to eq expected_output
  end

  it 'rejects withdraw if account has insufficient funds' do
    expected_output = { status: false, message: 'insufficient funds', date: Date.today }
    expect(subject.withdraw('1234', 105, account)).to eq expected_output
  end

  it 'reject withdraw if pin is wrong' do
    expected_output = { status: false, message: 'wrong pin', date: Date.today }
    expect(subject.withdraw('9999', 50, account)).to eq expected_output
  end

  it 'reject withdraw if ATM has insufficient funds' do
    # To prepare the test we want to decrease the funds value to a lower value then the original 1000
    subject.funds = 50
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw('1234', 100, account)).to eq expected_output
  end

  it 'reject withdraw if card is expired' do
    allow(account).to receive(:exp_date).and_return('12/15')
    expected_output = { status: false, message: 'card expired', date: Date.today }
    expect(subject.withdraw('1234', 5, account)).to eq expected_output
  end

  it 'account is disabled' do
    allow(account).to receive(:account_status).and_return(:disabled)
    expected_output = { status: false, message: 'card is disabled', date: Date.today, amount: 0 }
  #  expected_output = { status: false, message: 'card is disabled', account_status: :disabled, date: Date.today }
  #  expect(subject.withdraw('1234', 5, account)).not_to eq expected_output
    expect(subject.withdraw('1234', 5, account)).to eq expected_output
  end

  it 'account is active' do
    allow(account).to receive(:account_status).and_return(:active)
    expected_output = { status: true, message: 'success', date: Date.today, amount: 15 }
    expect(subject.withdraw('1234', 15, account)).to eq expected_output
  end

end
