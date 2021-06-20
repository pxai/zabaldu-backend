class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :comment_votes
end
