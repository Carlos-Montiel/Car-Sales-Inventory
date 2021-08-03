class Dealership < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
