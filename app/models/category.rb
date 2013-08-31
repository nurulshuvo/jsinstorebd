class Category < ActiveRecord::Base
  attr_accessible :parent_id, :content, :name
  has_many :products
  
  has_ancestry

  def to_s
    name
  end
end
