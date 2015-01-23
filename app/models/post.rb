class Post < ActiveRecord::Base
  require_dependency 'admin/post'
  mount_uploader :avatar, AvatarUploader
end
