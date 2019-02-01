# frozen_string_literal: true

require 'account'
require 'account_statement'

describe Account do

  let(:statement) { double :statement, deposit_statement: nil, withdraw_statement: nil }
  let(:accountstatement) { AccountStatement.new }
  let(:account) { Account.new(accountstatement) }

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
    describe 'deposit below zero' do
      it 'raise error if deposit is less than zero' do
        expect { account.deposit(-1) }.to raise_error('Amount needs to be greater than zero')
      end
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
    describe 'withdraw below zero' do
      it 'raise error if withdraw is less than zero' do
        expect { account.withdraw(-100) }.to raise_error('Amount needs to be greater than zero')
      end
    end
  end
  describe 'transaction_statement' do
    it 'keeping a statement of transactions' do
      account.deposit(100)
      account.withdraw(50)
      expect(accountstatement.statement.length).to eq(2)
      expect(accountstatement.statement.first[:credit]).to eq(100)
      expect(accountstatement.statement.last[:debit]).to eq(50)
      expect(account.balance).to eq(50)
    end
  end

  describe 'account_statement' do

    it 'shows a clients account statement' do
      account.deposit(100)
      account.withdraw(50)

      statement = "date || credit || debit || balance\n"\
                  "06-12-18 || 100 ||  || 100\n"\
                  "06-12-18 ||  || 50 || 50\n"
      expect(accountstatement).to receive(:transaction_statement).and_return(statement)
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end
end
