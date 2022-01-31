class Author < ApplicationRecord
    validates :name, :email, presence: true
    validates :email, uniqueness: { message: "emails is already taken"}
end
