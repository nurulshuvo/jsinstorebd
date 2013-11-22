class RemoveStripeCustomerTokenFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :stripe_customer_token, :string
  end
end
