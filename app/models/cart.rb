# == Schema Information
#
# Table name: carts
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  purchased_at :datetime
#

class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  # has_one :line_item, dependent: :destroy

  def add_product(product_id)
    # current_item = line_items.build(product_id: product_id)
    current_item = line_items.where(product_id: product_id).first
    if current_item
      # current_item.quantity += 1
      current_item.quantity = 1
    else
      line_items.delete_all
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    #for calculating the total price of the products in the cart
    line_items.to_a.sum { |item| item.total_price }
  end

  def to_s
    self.id
  end

def paypal_url(return_url, notify_url)
  values = {
    :business => 'seller@estore.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id,
    :notify_url => notify_url
  }
  line_items.each_with_index do |item, index|
    values.merge!({
      "amount_#{index+1}" => item.total_price,
      "item_name_#{index+1}" => item.product.title,
      "item_number_#{index+1}" => item.id,
      "quantity_#{index+1}" => item.quantity
    })
  end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end

end
