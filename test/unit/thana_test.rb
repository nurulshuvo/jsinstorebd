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

require 'test_helper'

class ThanaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
