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
| product_name                   | string              | null: false                       |
| product_description            | text                | null: false                       |
| price                          | integer             | null: false                       |
| category_id                    | integer             | null: false                       |
| condition                      | integer             | null: false                       |
| shipping_fee_responsibility    | integer             | null: false, foreign_key: true    |
| prefecture_id                  | integer             | null: false, foreign_key: true    |
| shipping_duration              | integer             | null: false, foreign_key: true    |

### Association
* belongs_to :user
* has_one : purchase_record





## purchase_records

| Column                      | Type                | Options                          |
|-----------------------------|---------------------|----------------------------------|
| user                        | references          | null: false                      |
| product                     | references          | null: false                      |
| shipping_address            | references          | null: false                      |

### Association
* belongs_to :user
* has_one : shipping_address








## shipping_address

| Column                         | Type                | Options                   |
|--------------------------------|---------------------|---------------------------|
| phone_number                   | string              | null: false               |
| postal_code                    | string              | null: false               |
| prefecture_id                  | string              | null: false               |
| city                           | string              | null: false               |
| address1                       | string              | null: false               |
| building_name                  | string              | null: false               |



### Association
* belongs_to : purchase_record