class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :check_in_date, :check_out_date, presence: true
  validate :user_cannot_book_own_flat

  def user_cannot_book_own_flat
    errors.add(:base, "User cannot book their own flat") if user.id == flat&.user_id
  end
end
