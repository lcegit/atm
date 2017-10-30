require './lib/atm.rb'
describe Atm do
  let(:account) { instance_double('Account') }

  before do
    allow(account).to recieve(:balance).and_return(100)
    allow(account).to recieve(:balance=)
  end
=begin
  end
  it 'has 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at withdrawal' do
    subject.withdraw 50
    expect(subject.funds).to eq 950
  end
=end

#  it 'gives a sucessful status update if enough funds' do
#  expect(subject.transaction).to eq(true)
#  end


#  it 'messages the user sucess' do
#    expect(subject.funds).to eq
#  end

#  it 'registers a date of the transaction'
#  expect(subject.funds).to eq
#  end

#  it'shows the balance if the transaction was successful'
#  expect(subject.funds).to eq
#  end

end
