# == Schema Information
#
# Table name: payment_notifications
#
#  id             :integer          not null, primary key
#  params         :text
#  cart_id        :integer
#  status         :string(255)
#  transaction_id :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PaymentNotification < ActiveRecord::Base
  attr_accessible :cart_id, :params, :status, :transaction_id
  belongs_to :cart
  has_many :payment_notifications
  serialize :params
  after_create :mark_cart_as_purchased

  private
    def mark_cart_as_purchased
      if status == "Completed"
        cart.update_attribute(:purchased_at, Time.now)
      end
    end
end
