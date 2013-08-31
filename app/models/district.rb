class District < ActiveRecord::Base
  attr_accessible :name, :division_id
  belongs_to :division
  has_many :thanas

  validates :division_id, :name, presence: true

  def to_s
    name
  end
end
