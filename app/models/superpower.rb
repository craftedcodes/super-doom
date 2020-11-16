class Superpower < ApplicationRecord
  has_many :rents
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
end
