class Phone < ApplicationRecord
  belongs_to :user, optional: true
  validates :phonenumber,presence: true
end
