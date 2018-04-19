class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :detail_bills
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :show_relation_book, (lambda do |id, page|
    where.not(id: id).paginate page: page,
      per_page: Settings.relation_book.max_page
  end)
end
