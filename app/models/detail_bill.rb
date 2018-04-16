class DetailBill < ApplicationRecord
  belongs_to :book
  belongs_to :bill
end
