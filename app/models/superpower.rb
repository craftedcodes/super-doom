class Superpower < ApplicationRecord
  has_many :rents
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  geocoded_by :location
  after_validation :geocode
  include PgSearch::Model
  pg_search_scope :srch,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
