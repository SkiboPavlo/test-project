class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable

  validates_presence_of :name
end
# ^[a-z]{2}$* ^[a-z]{2}$
