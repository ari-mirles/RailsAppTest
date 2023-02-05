class Author < ApplicationRecord
  validates :name, presence: true
  validates :bio, presence: true, length: { minimum: 10 }
end
