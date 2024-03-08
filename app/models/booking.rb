class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :check_in_date, :check_out_date, presence: true
  validates :user_cannot_book_own_flat

  def user_cannot_book_own_flat
    errors.add(:base, "User cannot book their own flat") if user_id == flat&.user_id
  end
end
