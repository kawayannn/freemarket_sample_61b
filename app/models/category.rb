class Category < ApplicationRecord
  has_many :items
  belongs_to :size, optional: true

  has_many :brand_categories
  has_many :brands,         through: :brand_categories
  
  has_ancestry
end
