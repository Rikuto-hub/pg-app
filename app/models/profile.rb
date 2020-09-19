class Profile < ApplicationRecord
    belongs_to :user

    validates :job, presence: true
    validates :introduction, presence: true
end
