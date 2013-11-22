# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  topic      :string(255)
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ActiveRecord::Base
  attr_accessible :body, :topic
end
