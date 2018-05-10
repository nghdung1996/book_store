class Author < ApplicationRecord
  has_many :books

  validates :name, :description, presence: true
end
