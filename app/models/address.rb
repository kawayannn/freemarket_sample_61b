class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :phonenumber, :address ,presence: true
end
