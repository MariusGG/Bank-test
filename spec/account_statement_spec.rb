# frozen_string_literal: true

require 'timecop'
require 'account_statement'

describe AccountStatement do
  before { Timecop.freeze(Time.local(1999)) }
  after { Timecop.return }
  let(:account_statement) { described_class.new }




  describe '#deposit_statement' do
    it 'shows the accounts deposit statement' do
      account_statement.deposit_statement(50, 100)
      expect(account_statement.statement.last.flatten)
        .to eq [:date, '01-01-99', :credit, 50, :balance, 100]
    end
  end

  describe '#withdraw_statement' do
    it 'shows the accounts withdraw statement' do
      account_statement.withdraw_statement(100, 200)
      expect(account_statement.statement.last.flatten)
        .to eq [:date, '01-01-99', :debit, 100, :balance, 200]
    end
  end
  describe 'transaction_statement display' do
    it "displays a simple header" do
    expect(account_statement.transaction_statement).to eq  ["date || credit || debit || balance"]
    end

  end
end
