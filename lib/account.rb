# frozen_string_literal: true

require_relative 'account_statement'
class Account
  attr_reader :balance, :statement_history
  def initialize(statement = AccountStatement.new)
    @balance = 0
    @statement_history = statement
  end

  def deposit(amount)
    check_if_integer(amount)
    greater_than_zero(amount)
    adjust_amount(amount)
    @statement_history.deposit_statement(amount, @balance)
  end

  def withdraw(amount)
    check_if_integer(amount)
    greater_than_zero(amount)
    error_if_amounts_greater_balance(amount)
    @statement_history.withdraw_statement(amount, @balance)
  end

  def print_statement
    puts @statement_history.transaction_statement
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

  def check_if_integer(amount)
    raise 'Not an integer' unless amount.is_a? Numeric
  end

  def greater_than_zero(amount)
    raise 'Amount needs to be greater than zero' if amount <= 0
  end
end
