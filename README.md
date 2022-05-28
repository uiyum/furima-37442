# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users
|Column              |Type  |Options    |
|--------------------|------|-----------|
|nickname            |string|null: false|
|email               |string|null: false, unique: true|
|encrypted_password  |string|null: false|
|family_name         |string|null: false|
|first_name          |string|null: false|
|family_name_furigana|string|null: false|
|first_name_furigana |string|null: false|
|birthday            |date  |null: false|

- has_many :sells
- has_many :buys

## sells
|Column       |Type      |Options    |
|-------------|----------|-----------|
|goods_name   |string    |null: false|
|text         |text      |null: false|
|category_id  |integer   |null: false|
|condition_id |integer   |null: false|
|postage_id   |integer   |null: false|
|prefecture_id|integer   |null: false|
|delivery_id  |integer   |null: false|
|price        |integer   |null: false|
|user         |references|null: false, foreign_key :true|

-belongs_to :user
-has_one :buy

## buys
|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|user    |references|null: false, foreign_key :true|
|sell    |references|null: false, foreign_key :true|

- belongs_to :user
- belongs_to :sell
- has_one :address

## addresses
|Column          |Type       |Options                       |
|----------------|-----------|------------------------------|
|postal_code     |string     |null: false                   |
|prefecture_id   |integer    |null: false                   |
|city            |string     |null: false                   |
|house_number    |string     |null: false                   |
|building        |string     |                              |
|telephone_number|string     |null: false                   |
|buy             |references |null: false, foreign_key :true|

-belong_to :buy