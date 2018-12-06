# frozen_string_literal: true
require 'account'

describe 'withdraw feature tests' do
  let(:account) { Account.new }

  it 'allows client to withdraw money' do
    account.deposit(100)
    account.withdraw(50)
    expect(account.balance).to eq(50)
  end
  it 'raises error when client withdraws below zero' do
    expect { account.withdraw(-5) }
    .to raise_error('Amount needs to be greater than zero')
  end
  it 'raises error when client does not enter an integer' do
    expect { account.withdraw('abc') }
      .to raise_error('Not an integer')
  end
end
