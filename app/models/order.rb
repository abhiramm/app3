class Order < ActiveRecord::Base
  belongs_to :performer
  belongs_to :duration
  belongs_to :delivery_time
  belongs_to :location
  belongs_to :quality
  belongs_to :clip_category
  has_many :custom_video
   accepts_nested_attributes_for :custom_video

end
