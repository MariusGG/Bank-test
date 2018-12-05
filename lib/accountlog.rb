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
    @log.push(date: Time.now.strftime('%d-%m-%y'), debit: amount, balance: balance )
  end



end
