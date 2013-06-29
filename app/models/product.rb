class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title
  validates :title, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      error.add(:base, 'Line Items present')
      return false
    end
  end
end
