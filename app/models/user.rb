class User < ActiveRecord::Base

  has_many :products
  devise :database_authenticatable, :registerable, :rememberable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude

validates :address, presence: true

  # geocode
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_gmappable

  def gmaps4rails_address
    address
  end

end
