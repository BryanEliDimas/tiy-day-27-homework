class Post < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader  # Allos updloading photos
end
