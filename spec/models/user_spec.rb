require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is invalid without an email' do
      user = described_class.new(email: '', password: '123456')
      expect(user).to_not be_valid
    end

    it 'is invalid without a password' do
      user = described_class.new(email: 'email@email.com', password: '')
      expect(user).to_not be_valid
    end

    it 'is invalid without a correct password' do
      user = described_class.new(email: 'email@email.com', password: '12345')
      expect(user).to_not be_valid
    end

    it 'is valid with correct attrs' do
      user = described_class.new(email: 'email@email.com', password: '123456')
      expect(user).to be_valid
    end
  end
end
