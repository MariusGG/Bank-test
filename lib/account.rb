# frozen_string_literal: true

class Account
  attr_reader :balance, :log
  def initialize
    @balance = 0
    @log = []
  end

  def deposit(amount)
    raise 'Not an integer' unless amount.is_a? Numeric

    @balance += amount
      @log.push(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    raise 'Not an integer' unless amount.is_a? Numeric
    if amount > @balance
      raise 'Insufficient funds'
    else
      @balance -= amount
      @log.push(debit: amount, balance: @balance)
    end
  end

end
