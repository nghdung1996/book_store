class Bill < ApplicationRecord
  has_many :detail_bills, dependent: :destroy
  belongs_to :orderer
  belongs_to :user
end
