class Bill < ApplicationRecord
  has_many :detail_bills, dependent: :destroy
  belongs_to :user

  validates :payment_type, :full_name, :address, :phone, :email, presence: true

  accepts_nested_attributes_for :detail_bills

  scope :order_desc, ->{order id: :desc}
end
