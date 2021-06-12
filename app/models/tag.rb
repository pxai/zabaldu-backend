class Tag < ApplicationRecord
    before_save :normalize
    has_many :article_tags
    has_many :articles, through: :article_tags
    private

    def normalize
        tag.downcase!
    end
end
