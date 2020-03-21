class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :birthday
  end

  has_one :card
  has_one :phone

  # あるユーザーが出品した全ての商品
  has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
  # あるユーザーが出品し、売れた商品
  has_many :sold_items, -> { where("buyer_id is not NULL") }, class_name: 'Item', foreign_key: 'seller_id'
  # あるユーザーが出品し、まだ売れていない商品
  has_many :salling_items, -> { where("buyer_id is NULL")}, class_name: "Item", foreign_key: 'seller_id'
  # あるユーザーが購入した商品
  has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id'

  def has_card?
    if self.card.present?
      $card = self.card
    end
  end
end
