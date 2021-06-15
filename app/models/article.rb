class Article < ApplicationRecord
  belongs_to :user
  belongs_to :status
  has_many :article_tags
  has_many :tags, through: :article_tags
end
