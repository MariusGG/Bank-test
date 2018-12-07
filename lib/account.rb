# frozen_string_literal: true

require_relative 'accountlog'
class Account
  attr_reader :balance, :log_history
  def initialize(log = Accountlog.new)
    @balance = 0
    @log_history = log
  end

  def deposit(amount)
    check_integer(amount)
    greater_than_zero(amount)
    @balance += amount
    @log_history.deposit_log(amount, @balance)
  end

  def withdraw(amount)
    check_integer(amount)
    greater_than_zero(amount)
    if amount > @balance
      raise 'Insufficient funds'
    else
      @balance -= amount
    end

    @log_history.withdraw_log(amount, @balance)
  end

  def check_integer(amount)
    raise 'Not an integer' unless amount.is_a? Numeric
  end

  def greater_than_zero(amount)
    raise 'Amount needs to be greater than zero' if amount <= 0
  end

  def print_log
    puts @log_history.transaction_log
  end
end
