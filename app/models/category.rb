class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable

  validates_presence_of :name
  validate :name_validations

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
end
