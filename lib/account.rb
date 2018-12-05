# frozen_string_literal: true
require_relative 'accountlog'

class Account
  attr_reader :balance, :log_history
  def initialize(log = Accountlog.new)
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

  def print_log
    puts @log_history.transaction_log
  end
end
