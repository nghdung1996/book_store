class Author < ApplicationRecord
  has_many :books

  scope :order_desc, ->{order id: :desc}

  validates :name, :description, presence: true
end
