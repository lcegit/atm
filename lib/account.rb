
class Account

  STANDARD_VALIDITY_YRS = 5

  attr_accessor :pin_code, :exp_date, :account_status
  attr_reader :person

def initialize
  @pin_code = generate_pin
  @account_status = :active
end

def deactivate
  @account_status = :deactivated
end

def set_expiry_date
  Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
end

private

def generate_pin
  rand(1000..9999)
end
end
