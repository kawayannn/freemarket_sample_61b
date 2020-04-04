## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birthday|date|null: false|
|introduction|text||

### Association
- has_one :address
- has_many :sell_items, class_name: 'Item', :foreign_key => 'sell_id'
- has_many :buy_items, class_name: 'Item', dependent: :destroy, :foreign_key => 'buyer_id'
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|integer|null: false, unique: true|
|prefecture_id|references|null: false, foreign_key: true|
|city|string|null: false|
|street_name|string|null: false, unique: true|
|building_name|string||
|user_id|references|null: false|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|postage|boolean|null: false|
|description|text|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|size_id|references|foreign_key: true|

### Association
- belongs_to_active_hash :prefecture
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :category
- belongs_to :brand
- belongs_to :size
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|ancestry|string|foreign_key: true|

### Association
- has_many :category
- has_many :items
- has_ancestry

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string||
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|foreign_key: true|

### Association
- has_many :items
- has_many :brand_categories
- has_many :categories, through: :brand_categories
- has_ancestry

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|foreign_key: true|
|size_id|references|foreign_key: true|

### Association
- has_ancestry
- belongs_to :size
- has_many :item_categories
- has_many :items, through: :item_categories
- has_many :brand_categories
- has_many :brands, through: :brand_categories

## brand_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :brand
- belongs_to :category