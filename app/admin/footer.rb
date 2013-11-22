class Footer < ActiveAdmin::Component
  def build
    super(id: "footer")
    para "Copyright #{Date.today.year} eStore"
  end
end