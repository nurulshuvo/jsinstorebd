# == Schema Information
#
# Table name: thanas
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  district_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Thana < ActiveRecord::Base
  attr_accessible :name, :district_id
  belongs_to :district

  validates :name, :district_id, presence: true

  def to_s
    name
  end
end
