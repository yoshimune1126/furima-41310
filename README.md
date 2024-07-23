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

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user_name          | string              | null: false               |
| password           | string              | null: false               |
| email              | string              | null: false, unique: true |
| date_of_birth      | date                | null: false               |
| full_name          | string              | null: false               |
| full_name_kana     | string              | null: false               |

### Association
* has_many :products
* has_many :purchase_records




## products

| Column                         | Type                | Options                   |
|--------------------------------|---------------------|---------------------------|
| product_image                  | string              | null: false               |
| product_name                   | string              | null: false               |
| product_description            | string              | null: false               |
| price                          | integer             | null: false               |
| category_id                    | string              | null: false               |
| condition                      | string              | null: false               |
| shipping_fee_responsibility    | integer             | null: false               |
| shipping_origin_area           | string              | null: false               |
| shipping_duration              | date                | null: false               |

### Association
* belongs_to :users
* has_one : purchase_records





## purchase_records

| Column                         | Type                | Options                          |
|--------------------------------|---------------------|----------------------------------|
| user_id                        | references          | null: false, foreign_key: true   |
| product_id                     | references          | null: false, foreign_key: true   |
| shipping_address_id            | references          | null: false, foreign_key: true   |

### Association
* belongs_to :users
* has_one : shipping_address








## shipping_address

| Column                         | Type                | Options                   |
|--------------------------------|---------------------|---------------------------|
| phone_number                   | integer             | null: false               |
| postal_code                    | integer             | null: false               |
| prefecture                     | string              | null: false               |
| city                           | string              | null: false               |
| address1                       | integer             | null: false               |

### Association
* belongs_to : purchase_records