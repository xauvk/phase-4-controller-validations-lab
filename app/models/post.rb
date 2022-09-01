class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 100}
    validate :category_validate

    def category_validate
        if category == "Fiction" || category == "Non-Fiction"
            errors.add(:category, "Sorry only Fiction or Non-Fiction")
        end
    end
end
