ActiveAdmin.register PaymentNotification do
  actions :all, except: [:edit, :show]
  index do
    column :status
    column "Payment Date", :created_at
    default_actions
  end
end
