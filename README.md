# テーブル設計

## users テーブル

| Column          | Type        | Options     |
| ----------------|-------------| ----------- |
| nickname        | string      | null: false |
| email           | string      | null: false |
| encrypted_password        | string      | null: false |
| last_name       | string      | null: false |
| first_name      | string      | null: false |
| last_name_kana  | string      | null: false |
| first/name_kana | string      | null: false |
| birthday_       | date_select | null: false |

## Association

- has_many :items
- has_many :orders

## items テーブル

| Column     | Type       | Options                        |
| -----------| -----------| -------------------------------|
| name       | text       | null: false                    |
| text       | text       | null: false                    |
| category_id   | integer     | null: false                    |
| status_id     | integer     | null: false                    |
| shipping_id   | integer     | null: false                    |
| area_id       | integer     | null: false                    |
| days_id       | integer     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type       | Options                        |
| -----------| -----------| -------------------------------|
| user       | references | null: false, foreign_key: true |
| access_at  | string     | null: false                    |

## Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| --------------| -----------| -------------------------------|
| postcode      | integer    | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false                    |
| orders        | references | null: false, foreign_key: true |

## Association

- belongs_to :order