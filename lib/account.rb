# frozen_string_literal: true

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
    if amount > @balance
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
  end
end
