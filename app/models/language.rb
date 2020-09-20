class Language < ApplicationRecord
    has_many :articles, dependent: :destroy
    belongs_to :user

    validates :language, presence: true
    validates :title, presence: true
end
