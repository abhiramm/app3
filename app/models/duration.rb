class Duration < ActiveRecord::Base
  has_many :duration_performers
  has_many :orders
end
