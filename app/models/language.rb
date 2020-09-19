class Language < ApplicationRecord
    belongs_to :user

    validates :language, presence: true
    validates :title, presence: true
end
