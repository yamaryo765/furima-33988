# テーブル設計

## usersテーブル

| Column            | Type   | Options                   |
| ----------------  | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| birth_day         | date   | null: false               |
| first_name        | string | null: false               |
| first_name_kana   | string | null: false               |
| family_name       | string | null: false               |
| family_name_kana  | string | null: false               |

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル

| Column            | Type       | Options                           |
| --------------    | ---------- | --------------------------------- |
| name              | string     | null: false                       |
| price             | integer    | null: false                       |
| description       | text       | null: false                       |
| category_id       | integer    | null: false                       |
| user              | references | null: false,foreign_key: true     | 
| shipping_cost_id  | integer    | null: false                       |
| shipping_area_id  | integer    | null: false                       |
| shipping_day_id   | integer    | null: false                       |
| status_id         | integer    | null: false                       |

### Association
- belongs_to :user
- has_one    :purchase_record

## purchase_recordsテーブル

| Column    |    Type    | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- has_one    :destination
- belongs_to :user
- belongs_to :item


## destinationsテーブル

| Column             | Type       | Options                        |
| ------------       | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| phone_number       | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    | 
| building_name      | string     |                                |
| purchase_record   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record
