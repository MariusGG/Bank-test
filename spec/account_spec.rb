# frozen_string_literal: true

require 'account'

describe Account do
  describe '#initialize' do
    it 'Has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

end
