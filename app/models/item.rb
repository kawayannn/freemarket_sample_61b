class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :seller, class_name: "User", dependent: :destroy
  belongs_to :buyer, class_name: "User"
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  
  with_options presence: true do
    validates :price, :postage, :description, :condition, :shipment_day, :prefecture_id, :seller_id, :category_id,presence: true
    validates :name, length: {maximum: 40}
    validates :description, length: {maximum: 1000}
    validates :price, numericality: {only_integer: true,greater_than: 300, less_than_or_equal_to: 9999999}
    with_options format: {with: /\A[0-9]+\z/} do
      validates :price
  end
end


  enum condition:{"新品、未使用": 0, "未使用に近い": 1}
  enum postage:{"送料込み(出品者負担)": 0, "着払い(購入者負担)": 1}
  enum shipment_day:{"1~2日で発送": 0, "3~4日で発送": 1, "5~6日で発送": 2}
end
