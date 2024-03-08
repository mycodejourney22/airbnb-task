class Flat < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :address, :price, :guest, :flat_type, presence: true
end
