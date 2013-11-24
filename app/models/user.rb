# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  address                :string(255)
#  latitude               :float
#  longitude              :float
#  gmaps                  :boolean
#

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
  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

  # acts_as_gmappable

  # def gmaps4rails_address
  #   self.address
  # end

  def to_s
    email
  end

  acts_as_messageable

end
