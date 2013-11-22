class AddBuyerAndSellerToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :buyer, :integer
    add_column :orders, :seller, :integer
  end
end
