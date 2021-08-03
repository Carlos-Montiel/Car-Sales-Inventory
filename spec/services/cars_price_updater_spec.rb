# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsPriceUpdater do
  fixtures :dealerships, :cars

  it 'dicrements price and update last_updated_price when the last updated proce date is behind exactly a month' do
    Car.update_all(last_updated_price: Date.today - 1.month)
    original_price = cars(:one).price
    described_class.call
    expect(Car.find(cars(:one).id).price).to eq(original_price * 0.98)
    expect(Car.find(cars(:one).id).last_updated_price).to eq(Date.today)
  end

  it 'does not dicrements price and update last_updated_price when the last updated proce date is not behind exactly a month' do
    original_price = cars(:one).price
    described_class.call
    expect(Car.find(cars(:one).id).price).to eq(original_price)
    expect(Car.find(cars(:one).id).last_updated_price).to_not eq(Date.today)
  end
end
