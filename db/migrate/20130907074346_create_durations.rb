class CreateDurations < ActiveRecord::Migration
  def change
    create_table :durations do |t|
      t.string :time
      t.integer :price

      t.timestamps
    end
  end
end
