# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| furigana_last_name  | string | null: false |
| furigana_first_name | string | null: false |
| birth_date          | date   | null: false |


### Association

-has_many :items
-has_many :comments
-has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| categories_id       | integer    | null: false                    |
| states_id           | integer    | null: false                    |
| delivery_charges_id | integer    | null: false                    |
| shipment_sources_id | integer    | null: false                    |
| days_to_ships_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_many :orders
-has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

###Association

-belongs_to :user
-belongs_to :item

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

###Association

-belongs_to :user
-belongs_to :item
-has_one :street_address

## street_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

###Association

-belongs_to :order

