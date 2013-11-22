class AddApprovedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :approved, :boolean, default: false
  end
end
