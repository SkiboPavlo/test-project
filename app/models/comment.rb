class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates_presence_of :author
  validates_presence_of :content
end
