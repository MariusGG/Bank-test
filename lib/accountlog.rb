# frozen_string_literal: true

require_relative 'accountlog'

class Accountlog
  attr_reader :log
  def initialize
    @log = []
  end

  def deposit_log(amount, balance)
    @log.push(date: Time.now.strftime('%d-%m-%y'), credit: amount, balance: balance)
  end

  def withdraw_log(amount, balance)
    @log.push(date: Time.now.strftime('%d-%m-%y'), debit: amount, balance: balance)
  end

  def transaction_log
    ['date || credit || debit || balance'] +
      @log.map do |logs|
        [
          logs[:date],
          logs[:credit],
          logs[:debit],
          logs[:balance]
        ].join(' || ')
      end
  end
end
