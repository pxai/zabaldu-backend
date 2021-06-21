class Article < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :category
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :article_votes
  before_save :set_default_category
  before_save :set_default_status

  private
  def set_default_status
    if status.blank?
      status_id = 1 
    end
  end

  def set_default_category
    if category.blank?
      category_id = 1 
    end
  end
end
