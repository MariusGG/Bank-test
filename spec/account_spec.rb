# frozen_string_literal: true

require 'account'
require 'accountlog'


describe Account do
  let(:log) { double :log, deposit_log: nil, withdraw_log: nil }
  let(:accountlog) { Accountlog.new }
  let(:account) { Account.new(accountlog) }

  describe '#initialize' do
    it 'Has a balance of zero' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'allows the client to deposit money' do
      account.deposit(100)
      expect(account.balance).to eq 100
    end
    it 'has to be an integer to deposit' do
      expect { account.deposit('abc') }.to raise_error('Not an integer')
    end
  end

  describe '#withdraw' do
    it 'allows the client to withdraw money' do
      account.deposit(100)
      account.withdraw(50)
      expect(account.balance).to eq 50
    end
    it 'has to be an integer to withdraw' do
      expect { account.withdraw('abc') }.to raise_error('Not an integer')
    end
    describe 'Insufficient funds' do
      it 'raises error if client withdraws more than the current balance' do
        account.deposit(100)
        expect { account.withdraw(1000) }.to raise_error('Insufficient funds')
      end
    end
  end
  describe 'transaction_log' do
    it 'keeping a log of transactions' do
     account.deposit(100)
     account.withdraw(50)
     expect(accountlog.log.length).to eq(2)
     expect(accountlog.log.first[:credit]).to eq(100)
     expect(accountlog.log.last[:debit]).to eq(50)
     expect(account.balance).to eq(50)
   end
 end
 
end
