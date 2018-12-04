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
    it 'can only deposit integers' do
     expect { subject.deposit('abc') }.to raise_error 'Not an integer'
   end
  end

  describe '#withdraw' do
    it 'allows the client to withdraw money' do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.balance).to eq 50
    end
    it 'can only withdraw integers' do
     expect { subject.withdraw('abc') }.to raise_error 'Not an integer'
   end
  end

end
