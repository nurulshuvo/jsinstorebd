class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price
    # for calculating the total price of a single line item
    product.price * quantity
  end
end
