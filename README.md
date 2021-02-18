# テーブル設計

## users テーブル

| Column          | Type        | Options     |
| ----------------|-------------| ----------- |
| nickname        | string      | null: false |
| email           | string      | null: false |
| password        | string      | null: false |
| last_name       | string      | null: false |
| first_name      | string      | null: false |
| last_name_kana  | string      | null: false |
| first/name_kana | string      | null: false |
| birthday_year   | date        | null: false |
| birthday_month  | date        | null: false |
| birthday_day    | date        | null: false |

## Association

- has_many :items
- has_many :orders

## items テーブル

| Column     | Type       | Options                        |
| -----------| -----------| -------------------------------|
| image      | string     | null: false                    |
| name       | text       | null: false                    |
| text       | string     | null: false                    |
| category   | string     | null: false                    |
| status     | string     | null: false                    |
| shipping   | string     | null: false                    |
| area       | string     | null: false                    |
| days       | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

## Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column     | Type       | Options                        |
| -----------| -----------| -------------------------------|
| user       | references | null: false, foreign_key: true |
| access_at  | string     | null: false                    |

## Association

- belongs_to :users
- has_one :items
- has_one :addresses

## addresses テーブル

| Column        | Type       | Options                        |
| --------------| -----------| -------------------------------|
| postcode      | integer    | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phon_number   | integer    | null: false                    |
| orders_id     | references | null: false, foreign_key: true |

## Association

- has_one :orders