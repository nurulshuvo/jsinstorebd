# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  pay_type   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  buyer      :integer
#  seller     :integer
#  approved   :boolean
#  delevery   :string(255)
#

class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type, :seller, :buyer, :approved, :delevery
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ['Check', 'Credit card', 'Purchase order']

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
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
