class Rent < ApplicationRecord
  belongs_to :superpower
  belongs_to :user
  validates :date_from, presence: true
  validates :date_to, presence: true
end
