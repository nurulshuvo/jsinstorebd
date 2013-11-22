class AddDeliveryOptionToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delevery, :string
  end
end
