require 'date'

class Atm
  attr_accessor :funds, :status, :message

  def initialize
    @funds = 1000
    @status == true || false
  end

  def withdraw(amount)
    @funds -=amount
  end

=begin
  def status
  #  @status = status
    if @funds == true
    else
      return false
    end
  end

  def transaction
    if withdraw == @funds
      print 'sucess'
    else
      print 'no success'
    end
end
end
=begin
    def message
      if success == true
        print "Sucess"
      else sucess == false
        print "Not able to withdraw"
      end

      def date
      DateTime.now

end
=end
