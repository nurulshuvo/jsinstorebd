class Division < ActiveRecord::Base
  attr_accessible :name
  has_many :districts

  def to_s
    name
  end
end
