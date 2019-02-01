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
    adjust_amount(amount)
    @log_history.deposit_log(amount, @balance)
  end

  def withdraw(amount)
    check_integer(amount)
    greater_than_zero(amount)
    error_if_amounts_greater_balance(amount)
    @log_history.withdraw_log(amount, @balance)
  end

  def print_log
    puts @log_history.transaction_log
  end

private

  def adjust_amount(amount)
    @balance += amount
  end

  def error_if_amounts_greater_balance(amount)
    if amount > @balance
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
  end

  def check_integer(amount)
    raise 'Not an integer' unless amount.is_a? Numeric
  end

  def greater_than_zero(amount)
    raise 'Amount needs to be greater than zero' if amount <= 0
  end
end
