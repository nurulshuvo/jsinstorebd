# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  address     :string(255)
#  latitude    :float
#  longitude   :float
#  gmaps       :boolean
#  user_id     :integer
#  category_id :integer
#  sold        :boolean          default(FALSE)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
