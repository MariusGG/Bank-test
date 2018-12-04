# frozen_string_literal: true

class Accountlog

  attr_reader :log
  def initialize
    @log = []
  end
  
  def deposit_log(amount, balance)
    @log.push(credit: amount, balance: balance)
  end

  def withdraw_log(amount, balance)
    @log.push(debit: amount, balance: balance )
  end

end
