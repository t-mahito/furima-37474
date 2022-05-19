# README

## itemsテーブル

| column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| encrypted_password | string  | null: false               |
| email              | string  | null: false, unique: true |
| first_name_kanji   | string  | null: false               |
| last_name_kanji    | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kane     | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Asociation
- has_many: items
- has_many: orders



## itemsテーブル

| column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | text       | null: false                    |
| text      | text       | null: false                    |
| category  | string     | null: false                    |
| condition | string     | null: false                    |
| delively  | string     | null: false                    |
| charge    | string     | null: false                    |
| area      | string     | null: false                    |
| days      | integer    | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Asociation
- belongs_to: user
- has_one: order


## ordersテーブル

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Asociation
- belongs_to: user
- has_one: item
- belongs_to: address


## addressテーブル

| column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| phone_number  | integer | null: false |

### Asociation
- belongs_to: order