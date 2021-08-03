require 'rails_helper'

RSpec.describe Dealership, type: :model do
  context 'validations' do
    it 'is invalid without a name' do
      dealership = described_class.new(name: '')
      expect(dealership).to_not be_valid
    end
  end

  context 'relations' do
    it 'has many cars' do
      dealership = described_class.reflect_on_association(:cars)
      expect(dealership.macro).to eq(:has_many)
    end
  end
end
