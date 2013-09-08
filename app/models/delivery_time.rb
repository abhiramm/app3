class DeliveryTime < ActiveRecord::Base
  has_many :delivery_time_performers
  has_many :orders
end
