class Category < ApplicationRecord
  has_many :items
  belongs_to :size, optional: true
  has_ancestry
end
