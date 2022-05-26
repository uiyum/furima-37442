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
|email               |string|null: false|
|encrypted_password  |string|null: false|
|family_name         |string|null: false|
|first_name          |string|null: false|
|family_name_furigana|string|null: false|
|first_name_furigana |string|null: false|
|birthday            |string|null: false|

- has_many :sells
- has_many :buys

## sells
|Column       |Type   |Options    |
|-------------|-------|-----------|
|goods_name   |string |null: false|
|text         |text   |null: false|
|category     |integer|null: false|
|condition    |integer|null: false|
|postage      |integer|null: false|
|prefecture   |integer|null: false|
|time         |integer|null: false|
|price        |integer|null: false|

-belongs_to :users
-has_one :buy

## buys
|Column  |Type   |Options                       |
|--------|-------|------------------------------|
|user    |string |null: false, foreign_key :true|
|sell    |string |null: false, foreign_key :true|

- belongs_to :users
- has_one :sell
- has_one :address

## addresses
|Column          |Type   |Options                       |
|----------------|-------|------------------------------|
|postal_code     |string |null: false                   |
|prefecture      |integer|null: false                   |
|city            |string |null: false                   |
|house_number    |integer|null: false                   |
|building        |string |                              |
|telephone_number|string |null: false                   |
|user            |string |null: false, foreign_key :true|
|buy             |string |null: false, foreign_key :true|

-belong_to :user
-belong_to :buy