# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  address     :string(255)
#  latitude    :float
#  longitude   :float
#  gmaps       :boolean
#  user_id     :integer
#  category_id :integer
#  sold        :boolean          default(FALSE)
#

class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessor :division, :district, :thana
  attr_accessible :description, :price, :title, :image, :address, :latitude,
                  :longitude, :user_id, :category_id, :division, :district, :thana,
                  :tag_list, :sold
  validates :title, :description, :user_id, presence: true

  acts_as_taggable

  # validates :address, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  has_many :line_items
  has_many :orders, through: :line_items
  mount_uploader :image, ProductImageUploader

  before_save { |product| product.title = product.title.downcase }
  before_save :product_address
  before_destroy :ensure_not_referenced_by_any_line_item

  def product_address
    self.address = "Bangladesh, #{division}, #{district}, #{thana}"
  end

  # geocode
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_gmappable

  CATEGORY_SELECT = ['Electronics', 'Apparel', 'Groceries']
  PRODUCT_ADDRESS = ['Barisal, Bangladesh', 'Chittagong, Bangladesh', 'Dhaka, Bangladesh', 'Khulna, Bangladesh', 'Sylhet, Bangladesh', 'Rangpur, Bangladesh']

def gmaps4rails_address
  "Bangladesh, #{division}, #{district}, #{thana}"
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
