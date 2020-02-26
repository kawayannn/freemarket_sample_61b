class Brand < ApplicationRecord
  has_many :items
  has_many :categories,         through: :brand_categories
  has_many :brand_categories
  has_ancestry
end
