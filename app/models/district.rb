# == Schema Information
#
# Table name: districts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  division_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class District < ActiveRecord::Base
  attr_accessible :name, :division_id
  belongs_to :division
  has_many :thanas

  validates :division_id, :name, presence: true

  def to_s
    name
  end
end
