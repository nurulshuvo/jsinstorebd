class User < ActiveRecord::Base

  has_many :products
  devise :database_authenticatable, :registerable, :rememberable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude

validates :address, presence: true
acts_as_commentable
letsrate_rater
letsrate_rateable "rating"

USER_ADDRESS = ['Barisal, Bangladesh', 'Chittagong, Bangladesh', 'Dhaka, Bangladesh', 'Khulna, Bangladesh', 'Sylhet, Bangladesh', 'Rangpur, Bangladesh']

  # geocode
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_gmappable

  def gmaps4rails_address
    address
  end

  def to_s
    email
  end

  acts_as_messageable

end
