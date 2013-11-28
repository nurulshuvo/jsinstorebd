module ApplicationHelper
  include FacebookShare

  def page_title(title)
    b_title = "eStore"
    if title.empty?
      b_title
    else
      "#{b_title} - #{title}"
    end
  end
end
