class Post < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :category
  has_many :comments, as: :commentable
  validates_presence_of :name

  validate :image_size_validation
  validate :name_validations

  private

  def name_validations
    words = name.split(".")
    if words.count < 2
      errors.add(:name, "can't be less than 2 words")
    end

    unless name =~ /^[A-Z]/
      errors.add(:name, "can't start from lower case")
    end

    if words.detect {|w| w.size > 2}
      errors.add(:name, "can't have more than 2 letters")
    end
  end

  def image_size_validation
    errors[:file] << "should be less than 2Mb" if file.size > 2.megabytes
  end
end
