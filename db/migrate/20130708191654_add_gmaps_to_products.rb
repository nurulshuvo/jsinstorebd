class AddGmapsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :gmaps, :boolean
  end
end
