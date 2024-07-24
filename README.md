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
| encrypted_password | string              | null: false               |
| email              | string              | null: false, unique: true |
| date_of_birth      | date                | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |


### Association
* has_many :products
* has_many :purchase_records




## products

| Column                         | Type                | Options                           |
|--------------------------------|---------------------|-----------------------------------|
| user                           | references          | null: false,foreign_key: true     |
| product_name                   | string              | null: false                       |
| product_description            | text                | null: false                       |
| price                          | integer             | null: false                       |
| category_id                    | integer             | null: false                       |
| condition_id                   | integer             | null: false                       |
| shipping_fee_responsibility_id | integer             | null: false                       |
| prefecture_id                  | integer             | null: false                       |
| shipping_duration_id           | integer             | null: false                       |

### Association
* belongs_to :user
* has_one :purchase_record





## purchase_records

| Column                      | Type                | Options                          |
|-----------------------------|---------------------|----------------------------------|
| user                        | references          | null: false,foreign_key: true    |
| product                     | references          | null: false,foreign_key: true    |

### Association
* belongs_to :user
* belongs_to :product
* has_one :shipping_address








## shipping_addresses

| Column                         | Type                | Options                                    |
|--------------------------------|---------------------|--------------------------------------------|
| phone_number                   | string              | null: false                                |
| postal_code                    | string              | null: false                                |
| prefecture_id                  | integer             | null: false                                |
| city                           | string              | null: false                                |
| address                        | string              | null: false                                |
| building_name                  | string              |                                            |
| purchase_record                | references          | null: false,foreign_key: true              |



### Association
* belongs_to :purchase_record