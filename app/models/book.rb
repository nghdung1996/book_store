class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :detail_bills
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
end
