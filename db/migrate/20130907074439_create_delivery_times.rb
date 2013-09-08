class CreateDeliveryTimes < ActiveRecord::Migration
  def change
    create_table :delivery_times do |t|
      t.string :duration

      t.timestamps
    end
  end
end
