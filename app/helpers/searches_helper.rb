module SearchesHelper
  def auto_tag
    tags = ActsAsTaggableOn::Tag.all
    taglist = []
    tags.each do |tag|
      taglist << tag.name
    end
    taglist
  end
end
