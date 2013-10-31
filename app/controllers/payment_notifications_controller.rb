class PaymentNotificationsController < ApplicationController
  before_filter :authenticate_user!, only: :index
  protect_from_forgery except: :create
  def create
    PaymentNotification.create!(params: params, cart_id: params[:invoice], status: params[:payment_status], transaction_id: params[:txn_id])
    render nothing: true
  end

  def index
    @payment_notifications = PaymentNotification.all
  end
end
