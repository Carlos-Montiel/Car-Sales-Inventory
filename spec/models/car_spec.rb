require 'rails_helper'

RSpec.describe Car, type: :model do
  fixtures :dealerships
  let(:valid_attributes) { {model: "Jetta 2021", brand: "VW", description: "a car description", 
    dealership_id: dealerships(:one).id, price: 123456, condition: "new_cars", stock: 500} }

  context 'validations' do
    it 'is invalid without a model' do
      valid_attributes[:model] = ''
      dealership = described_class.new valid_attributes
      expect(dealership).to_not be_valid
    end

    it 'is invalid without a brand' do
      valid_attributes[:brand] = ''
      dealership = described_class.new valid_attributes
      expect(dealership).to_not be_valid
    end

    it 'is invalid without a description' do
      valid_attributes[:description] = ''
      dealership = described_class.new valid_attributes
      expect(dealership).to_not be_valid
    end

    it 'is invalid without a price' do
      valid_attributes[:price] = nil
      dealership = described_class.new valid_attributes
      expect(dealership).to_not be_valid
    end

    it 'is valid with valid attributes' do
      dealership = described_class.new valid_attributes
      expect(dealership).to be_valid
    end
  end

  context 'relations' do
    it 'belongs to dealership' do
      car = described_class.reflect_on_association(:dealership)
      expect(car.macro).to eq(:belongs_to)
    end
  end
end
