class Category < ApplicationRecord
  has_many :books

  scope :order_desc, ->{order id: :desc}

  validates :name, presence: true
end
