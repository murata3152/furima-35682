# README

## users テーブル

| Column                          | Type   | Options     |
| ------------------------------- | ------ | ----------- |
| nickname                        | string | null: false |
| last_name                       | string | null: false |
| first_name                      | string | null: false |
| last_name_details               | string | null: false |
| first_name_details              | string | null: false |
| birthday                        | string | null: false |
| email                           | string | null: false |
| password                        | text   | null: false |
| password_confirmation           | text   | null: false |

### Association

has_many :items
has_many :buys_items, foreign_key: "buyer_id", class_name: "Item"
has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"



## items テーブル

| Column          | Type       | Options                              |
| --------------- | ---------- | ------------------------------------ |
| item_name       | string     | null: false                          |
| image           | has_one_attached                                  |
| price           | string     | null: false                          |
| details         | text       | null: false                          |
| status          | text       | null: false                          |
| postage         | string     | null: false                          |
| area            | text       | null: false                          |
| days            | string     | null: false                          |
| seller_id       | references |  null: false, foreign_key: seller_id |
| buyer_id        | references |  null: false, foreign_key: buyer_id  |

### Association

belongs_to :user
belongs_to :seller, class_name: "User"
belongs_to :buyer,  class_name: "User"
has_one :buy

## buys テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| items       | references | null: false, foreign_key: true |

### Association
has_one :address
belongs_to :item

## address テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| items       | references | null: false, foreign_key: true |


### Association

- belongs_to :buy