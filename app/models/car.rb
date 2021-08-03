# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :dealership

  validates :model, :brand, :description, :price, presence: true

  has_one_attached :image

  enum condition: %w[new_cars used_cars]

  before_create :set_last_updated_price_date

  private

  def set_last_updated_price_date
    self.last_updated_price = Date.today
  end
end
