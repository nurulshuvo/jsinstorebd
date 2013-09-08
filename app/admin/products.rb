ActiveAdmin.register Product do
  index do
    column :id
    column :title
    column :description
    column :price, sortable: :price do |product|
      number_to_currency product.price
    end
    column "Release Date", :created_at
    column :address
    default_actions
  end
end
