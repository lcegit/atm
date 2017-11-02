
class Account

  STANDARD_VALIDITY_YRS = 5

  attr_accessor :pin_code, :exp_date, :account_status
  attr_reader :person, :owner

  def initialize(attrs = {})
    @owner = person
    @pin_code = generate_pin
    @account_status = :active
    set_expiry_date
    set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

  def set_expiry_date
    @exp_date = Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

  private

  def generate_pin
    rand(1000..9999)
  end

  def set_owner(obj)
    obj == nil ?  missing_owner : @owner = obj
  end

  def missing_owner
    raise "An Account owner is required"
  end

end
