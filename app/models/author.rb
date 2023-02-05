class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :bio, presence: true, length: { minimum: 10 }
end
