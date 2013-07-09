class Product < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :price, :title, :image, :address, :latitude, :longitude, :user_id
  validates :title, :description, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  has_many :line_items
  has_many :orders, through: :line_items
  mount_uploader :image, ProductImageUploader

  before_destroy :ensure_not_referenced_by_any_line_item

  # geocode
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_gmappable

def gmaps4rails_address
  "#{self.address}"
end

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      error.add(:base, 'Line Items present')
      return false
    end
  end
end
