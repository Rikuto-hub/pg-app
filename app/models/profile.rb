class Profile < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar
    validates :job, presence: true
    validates :introduction, presence: true
end
