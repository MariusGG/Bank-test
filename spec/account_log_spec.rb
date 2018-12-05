# frozen_string_literal: true

require 'timecop'
require 'accountlog'

describe Accountlog do
  before { Timecop.freeze(Time.local(1999)) }
  after { Timecop.return }
  let(:accountlog) { described_class.new }

  describe '#deposit_log' do
    it 'shows the accounts deposit log' do
      accountlog.deposit_log(50, 100)
      expect(accountlog.log.last.flatten)
        .to eq [:date, '01-01-99', :credit, 50, :balance, 100]
    end
  end

  describe '#withdraw_log' do
    it 'shows the accounts withdraw log' do
      accountlog.withdraw_log(100, 200)
      expect(accountlog.log.last.flatten)
        .to eq [:date, '01-01-99', :debit, 100, :balance, 200]
    end
  end
end
