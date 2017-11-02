
class Account

  STANDARD_VALIDITY_YRS = 5

  attr_accessor: :pin_code, :account_status, :funds, :balance :exp_date, :account_owner

def initialize
  @funds = 1000
  @account_owner = account_owner
  @pin_code = rand(1000..9999)
end

def set_expiry_date
  Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
end
