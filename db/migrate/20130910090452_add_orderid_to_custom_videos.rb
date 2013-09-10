class AddOrderidToCustomVideos < ActiveRecord::Migration
  def change
    add_column :custom_videos, :order_id, :integer
  end
end
