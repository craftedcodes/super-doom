class Superpower < ApplicationRecord
  has_many :rents
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
end
