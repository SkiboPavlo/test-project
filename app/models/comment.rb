class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates_presence_of :author
  validates_presence_of :content

  validate :author_validations

  private

  def author_validations
    words = author.split(".")
    if words.count < 2
      errors.add(:author, "can't be less than 2 words")
    end

    unless author =~ /^[A-Z]/
      errors.add(:author, "can't start from lower case")
    end

    if words.detect {|w| w.size > 2}
      errors.add(:author, "can't have more than 2 letters")
    end
  end
end
