class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :flats
  validates :first_name, :last_name, :is_host, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
