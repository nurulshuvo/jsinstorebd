class AddTagToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :tag, :string
  end
end
