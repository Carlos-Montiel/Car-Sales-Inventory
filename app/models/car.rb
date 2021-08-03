# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :dealership

  validates :model, :brand, :description, :price, presence: true

  has_one_attached :image

  enum condition: %w[new_cars used_cars]
end
