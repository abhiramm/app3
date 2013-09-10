class RemoveCustomvideoidFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :custom_video_id, :integer
  end
end
