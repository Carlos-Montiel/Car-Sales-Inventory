# frozen_string_literal: true

# update montly price dicrementing .02%
class CarsPriceUpdater < ApplicationService
  def initialize; end

  def call
    elements = Car.where("last_updated_price = (CURRENT_DATE - INTERVAL '1 month')")
    elements.update_all('last_updated_price = CURRENT_DATE, price = (price * 0.98)')
  end
end
