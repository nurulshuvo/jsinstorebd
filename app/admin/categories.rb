ActiveAdmin.register Category do
  # form do |f|
  #     f.inputs "Details" do
  #       f.input :name
  #       f.input :content, label: "Description"
  #       f.input :ancestry, label: "Parent Category"
  #       # f.input :published_at, :label => "Publish Post At"
  #       # f.input :category
  #     end
  #     # f.inputs "Content" do
  #     #   f.input :body
  #     # end
  #     f.actions
  #   end

  form :partial => "form"
end
