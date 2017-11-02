
require 'date'

class Account

  STANDARD_VALIDITY_YRS = 5

  attr_accessor :pin_code, :exp_date, :account_status
  attr_reader :person, :owner, :balance

  def initialize(attrs = {}) #allows you to add several paramaters to attr
    #@owner = person
    @pin_code = generate_pin
    @account_status = :active
    @exp_date = set_expiry_date
    @owner = set_owner(attrs[:owner])
    @balance = 0
  end

  def deactivate
    @account_status = :deactivated
  end



  private

  def set_expiry_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def generate_pin
    rand(1000..9999)
  end

  def set_owner(obj)
    obj == nil ?  missing_owner : obj # if obj == nil => missing owner else @owner = obj
  end

  def missing_owner
    raise "An Account owner is required"
  end

end
