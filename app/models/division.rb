# == Schema Information
#
# Table name: divisions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Division < ActiveRecord::Base
  attr_accessible :name
  has_many :districts

  def to_s
    name
  end
end
