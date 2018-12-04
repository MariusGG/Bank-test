
class Account

  attr_reader :balance
  def initialize
    @balance = 0
  end

  def deposit(amount)
    raise 'Not an integer' unless amount.is_a? Numeric

    @balance += amount
  end

  def withdraw(amount)
    raise 'Not an integer' unless amount.is_a? Numeric

    @balance -= amount
  end

end
