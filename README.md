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

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | text       | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| shipment_source | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :order
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

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | integer    | null: false                    |

###Association

-belongs_to :orders

