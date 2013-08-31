class Thana < ActiveRecord::Base
  attr_accessible :name, :district_id
  belongs_to :district

  validates :name, :district_id, presence: true

  def to_s
    name
  end
end
