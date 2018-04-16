class Category < ApplicationRecord
  has_many :books
  has_many :childrens, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Category.name, foreign_key: :parent_id
end
