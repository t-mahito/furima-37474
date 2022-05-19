# README

## usersテーブル

| column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| encrypted_password | string  | null: false               |
| email              | string  | null: false, unique: true |
| first_name_kanji   | string  | null: false               |
| last_name_kanji    | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kane     | string  | null: false               |
| birthday           | Date    | null: false               |


### Asociation
- has_many: items
- has_many: orders



## itemsテーブル

| column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| charge_id    | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| delively_id  | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Asociation
- belongs_to: user
- has_one: order


## ordersテーブル

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Asociation
- belongs_to: user
- belongs_to: item
- has_one: address


## addressテーブル

| column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| area_id       | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Asociation
- belongs_to: order