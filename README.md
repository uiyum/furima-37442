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
|Column  |Type  |Options    |
|--------|------|-----------|
|nickname|string|null: false|
|email   |string|null: false|
|password|string|null: false|

- has_many :sells
- has_many :buys
_ has_one :addresses

## sells
|Column       |Type  |Options    |
|-------------|------|-----------|
|image        |string|null: false|
|goods_name   |string|null: false|
|text         |text  |null: false|
|category     |string|null: false|
|condition    |string|null: false|
|postage      |string|null: false|
|prefectures  |string|null: false|
|time         |string|null: false|
|price        |string|null: false|

-belongs_to :users
-has_one :buys

## buys
|Column  |Type   |Options                       |
|--------|-------|------------------------------|
|credit  |integer|null: false                   |
|user    |string |null: false, foreign_key :true|
|sell    |string |null: false, foreign_key :true|
|address |string |null: false, foreign_key :true|

- belongs_to :users
- has_one :sells
- has_one :addresses

## addresses
|Column          |Type   |Options                       |
|----------------|-------|------------------------------|
|postal_code     |integer|null: false                   |
|prefectures     |string |null: false                   |
|municipalities  |string |null: false                   |
|house_number    |integer|null: false                   |
|building        |string |                              |
|telephone_number|integer|null: false                   |
|user            |string |null: false, foreign_key :true|
|buy             |string |null: false, foreign_key :true|

-belong_to :user
-belong_to :buy