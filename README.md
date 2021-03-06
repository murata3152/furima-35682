# README

## users テーブル

| Column                          | Type   | Options                  |
| ------------------------------- | ------ | ------------------------ |
| nickname                        | string | null: false              |
| last_name                       | string | null: false              |
| first_name                      | string | null: false              |
| last_name_details               | string | null: false              |
| first_name_details              | string | null: false              |
| birthday                        | date   | null: false              |
| email                           | string | null: false, unique:true |
| encrypted_password              | text   | null: false              |


### Association

has_many :items
has_many :buys

## items テーブル

| Column          | Type       | Options                              |
| --------------- | ---------- | ------------------------------------ |
| item_name       | string     | null: false                          |
| price           | integer    | null: false                          |
| details         | text       | null: false                          |
| status_id       | integer    | null: false                          |
| postage_id      | integer    | null: false                          |
| area_id         | integer    | null: false                          |
| day_id          | integer    | null: false                          |
| category_id     | integer    | null: false                          |
| user            | references | null: false, foreign_key: true       |
<!-- imageはactive_storageを使用 -->

### Association

belongs_to :user
has_one :buy

## buys テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
has_one :address
belongs_to :user
belongs_to :item

## address テーブル

| Column         | Type       | Options                              |
| -------------- | ---------- | ------------------------------------ |
| postal_code    | string     | null: false                          |
| prefecture_id  | integer    | null: false                          |
| municipality   | string     | null: false                          |
| address        | string     | null: false                          |
| building_name  | string     |                                      |
| phone_number   | string     | null: false                          |
| buy            | references | null: false,  foreign_key: true      |


### Association

- belongs_to :buy