class SnsCredential < ApplicationRecord
  validates :uid, uniqueness: true
  belongs_to :user
end
