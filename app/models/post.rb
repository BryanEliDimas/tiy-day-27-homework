class Post < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader  # Allows updloading photos
  acts_as_taggable
end
