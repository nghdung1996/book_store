class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :bills, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
end
