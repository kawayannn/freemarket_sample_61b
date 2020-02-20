class Size < ApplicationRecord
  has_many :items
  has_many :categories
  has_ancestry
end
