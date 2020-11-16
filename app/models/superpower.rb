class Superpower < ApplicationRecord
  has_many :rents
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
end
