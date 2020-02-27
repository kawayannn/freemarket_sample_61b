class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum condition:{"選択してください": nil, "新品、未使用": 0, "未使用に近い": 1}, _prefix: true

  enum postage:{"選択してください": nil, "送料込み(出品者負担)": 0, "着払い(購入者負担)": 1}, _prefix: true
end
