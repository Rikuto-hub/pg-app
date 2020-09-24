class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_one_attached :article_img
    belongs_to :language
end
