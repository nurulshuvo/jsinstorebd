class User < ActiveRecord::Base

  has_many :products
  devise :database_authenticatable, :registerable, :rememberable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude

validates :address, :latitude, :longitude, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
