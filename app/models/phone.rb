class Phone < ApplicationRecord
  belongs_to :user, optional: true
  validates :phonenumber,presence: true, format: { with: /\A\d{10,11}\z/}
end
