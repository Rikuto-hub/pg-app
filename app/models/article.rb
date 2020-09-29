class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many_attached :article_imgs
    belongs_to :language
end
