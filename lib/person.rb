require './lib/account'
require './lib/atm'

class Person

  attr_accessor :name, :cash, :account

  def initialize(name = nil)
    @name = set_name(name)
    @cash = 0
    @account = nil
    @deposit = 100
  end

  def create_account
    @account = Account.new({owner: self})
  end

  def deposit_funds(amount)
     @account == nil ? no_account : @account.balance += amount
  end

  private

  def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end

  def missing_name
    raise "A name is required"
  end

  def no_account
    raise "No account present"
  end


end
