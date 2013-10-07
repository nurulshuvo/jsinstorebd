ActiveAdmin.register Report do
  index do
    column "Product Id", :topic
    column "From", :body
  end
end
