# frozen_string_literal: true

require 'accountlog'

describe Accountlog do
  let(:accountlog) { described_class.new }

  describe '#deposit_log' do
     it 'show the accounts deposit log' do
       accountlog.deposit_log(50, 100)
       expect(accountlog.log.last.flatten).to eq [:credit, 50, :balance, 100]
     end
  end

  describe '#withdraw_log' do
     it 'show the accounts withdraw log' do
       accountlog.withdraw_log(100, 200)
       expect(accountlog.log.last.flatten).to eq [:debit, 100, :balance, 200]
     end
  end
end
