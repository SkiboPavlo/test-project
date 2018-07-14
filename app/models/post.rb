class Post < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :category
  has_many :comments, as: :commentable
end
