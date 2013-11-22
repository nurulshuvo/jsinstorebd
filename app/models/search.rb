# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  keywords    :string(255)
#  category_id :integer
#  min_price   :decimal(, )
#  max_price   :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag         :string(255)
#

class Search < ActiveRecord::Base
  attr_accessible :category_id, :keywords, :max_price, :min_price, :tag

  def products
    @products = find_products
  end

  private

  def find_products
    products ||= Product.order(:title)
    products = products.tagged_with(tag.split(','), any: true) if tag.present?
    products = products.where("title like ?", "%#{keywords}%") if keywords.present?
    products = products.where(category_id: category_id) if category_id.present?
    products = products.where("price >= ?", min_price) if min_price.present?
    products = product.where("price <= ?", max_price) if max_price.present?
    products
  end
end
