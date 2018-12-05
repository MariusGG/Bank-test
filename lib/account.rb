# frozen_string_literal: true

class Account
  attr_reader :balance, :log_history
  def initialize(log)
    @balance = 0
    @log_history = log
  end

  def deposit(amount)
    raise 'Not an integer' unless amount.is_a? Numeric

    @balance += amount
    @log_history.deposit_log(amount, @balance)
  end

  def withdraw(amount)
    raise 'Not an integer' unless amount.is_a? Numeric
    if amount > @balance
      raise 'Insufficient funds'
    else
      @balance -= amount
      @log_history.withdraw_log(amount, @balance)
    end
  end

end
