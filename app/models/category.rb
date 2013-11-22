# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  ancestry   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :parent_id, :content, :name
  has_many :products
  
  has_ancestry

  def to_s
    name
  end
end
