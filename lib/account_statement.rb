# frozen_string_literal: true

require_relative 'account_statement'

class AccountStatement
  attr_reader :statement
  def initialize
    @statement = []
  end

  def deposit_statement(amount, balance)
    @statement.push(date: Time.now.strftime('%d-%m-%y'), credit: amount, balance: balance)
  end

  def withdraw_statement(amount, balance)
    @statement.push(date: Time.now.strftime('%d-%m-%y'), debit: amount, balance: balance)
  end

  def transaction_statement
    ['date || credit || debit || balance'] +
      @statement.map do |statements|
        [
          statements[:date],
          statements[:credit],
          statements[:debit],
          statements[:balance]
        ].join(' || ')
      end
  end
end
