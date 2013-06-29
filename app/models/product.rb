class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title
  validates :title, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
