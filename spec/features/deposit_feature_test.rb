# frozen_string_literal: true

require 'account'

describe 'Withdrawal feature tests' do
  let(:account) { Account.new }

  it 'allows client to deposit money' do
    account.deposit(100)
    expect(account.balance).to eq(100)
  end
  it 'raises error when client deposits below zero' do
    expect { account.deposit(-5) }
      .to raise_error('Amount needs to be greater than zero')
  end
  it 'raises error when client does not enter an integer' do
    expect { account.deposit('abc') }
      .to raise_error('Not an integer')
  end
end
