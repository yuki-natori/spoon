# README
```
git clone https://github.com/yuki-natori/spoon.git
```


## DB設計
### Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|string||
|first_name|string||
|last_name_kane|string||
|first_name_kane|string||
|birth_year|integer||
|birth_manth|integer||
|birth_day|integer||
|email|string|null: false, unique: true|
|password|string||

#### Association
- has_many :comments
- has_many :items
- has_many :likes
- has_many :sns_credentials
- has_many :trading_partners
- has_one :credit_card
- has_one :profile

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|phone_number|integer|unique:true|
|zipcode|integer||
|prefecture|integer||
|city|string||
|block|string||
|building|string||
|user_id|references|null:false,index:true,foreign_key:true|

#### Association
- belongs_to user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|authorization_code|integer|null:false,unique:true|
|security_code|integer|null:false|
|month|integer|null:false|
|year|integer|null:false|
|user_id|references|null:false,index:true,foreign_key:true|

#### Association
- belongs_to user

### Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|description|text|null: false|
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_from|integer|null: false|
|days_before_shipping|integer|null: false|
|shipping_method|integer|null: false|
|trade_status|integer|null: false|
|brand_id|references|index: true, foreign_key: true|
|category_id|references|null: false. index:true, foreign_key:true|
|user_id|references|null: false. index:true, foreign_key:true|
|size_id|references|null: false. index:true, foreign_key:true|

#### Association
- belongs_to :brand
- belongs_to :category
- belongs_to :user
- belongs_to size
- has_many :comments
- has_many :images
- has_many :likes
- has_one :order

### Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|null: false, index: true, foreign_key: true|

- belong_to :item