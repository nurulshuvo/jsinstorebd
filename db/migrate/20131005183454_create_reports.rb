class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :topic
      t.string :body

      t.timestamps
    end
  end
end
