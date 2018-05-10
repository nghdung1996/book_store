class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :detail_bills
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :images

  validates :name, :publish_year, :default_price, :content, presence: true

  delegate :image, to: :image_first, allow_nil: true

  scope :order_desc, ->{order created_at: :desc}

  scope :show_relation_book, (lambda do |id, page|
    where.not(id: id).paginate page: page,
      per_page: Settings.relation_book.max_page
  end)

  def image_first
    images.first
  end
end
