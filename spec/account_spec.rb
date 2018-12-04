# frozen_string_literal: true

require 'account'

describe Account do
  describe '#initialize' do
    it 'Has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'allows the client to deposit money' do
      subject.deposit(100)
      expect(subject.balance).to eq 100
    end
  end

end
