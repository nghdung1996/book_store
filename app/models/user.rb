class User < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
end
