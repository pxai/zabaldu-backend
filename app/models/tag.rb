class Tag < ApplicationRecord
    before_save :normalize

    private

    def normalize
        tag.downcase!
    end
end
