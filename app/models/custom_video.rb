class CustomVideo < ActiveRecord::Base
  #attr_accessible :path
  belongs_to :order

    mount_uploader :path, VideoUploader
    end