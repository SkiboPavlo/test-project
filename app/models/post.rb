class Post < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :category
  has_many :comments, as: :commentable
  validates_presence_of :name

  validate :image_size_validation

  private

  def image_size_validation
    errors[:file] << "should be less than 2Mb" if file.size > 2.megabytes
  end
end
