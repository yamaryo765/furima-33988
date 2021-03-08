 README

### アプリケーション名
furima-33988

### 概要
誰でも利用できるフリマアプリです。
商品の売買が可能です。購入はテスト購入のため実際の取引は行われません。

### URL
https://furima-33988.herokuapp.com/

### テスト用アカウント
認証：admin
パス：2222

出品者用のメールアドレスとパスワード
アドレス：test1@gmail.com
パス：123asd

購入者用のメールアドレスとパスワード
アドレス：tester2@gmail.com
パス：asd123

### 利用方法
新規登録をして、右下の出品ボタンを押す。商品情報を入力して出品完了
テスト購入は商品をクリックして「購入画面に進む」をクリック。必要情報を入力して購入
以下クレジット情報
4242424242424242（16桁）
cvc→123
期限は未来の情報を入力してください

### 目指した課題解決
使われなくなったモノを売買することで新たなモノの価値を復活させる。ムダなモノをなくす。
お金を払うのではなく、お金を受け取ってモノを処分することでムダ削減を図る。

### 実装した機能についての説明
ユーザー管理機能→deviseを使って実装
商品出品機能→dbに商品情報を保存する
商品購入機能→購入記録dbに購入者情報を登録する
商品一覧機能→トップページに商品画像が複数表示されている
商品削除機能→商品を投稿したユーザーが自分の商品にかぎり削除できる
商品情報編集機能→商品を投稿したユーザーが自分の商品にかぎり編集できる
パンくずリスト→ユーザーのいるページがどこかわかる
エラー日本語化→日本語でエラー表示されるので内容がわかりやすい

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
| purchase_record    | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record
