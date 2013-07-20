class Image < ActiveRecord::Base
  belongs_to :project
  attr_accessible :file
  mount_uploader :file, PictureUploader
end
