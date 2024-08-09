class Item < ApplicationRecord
  has_one :order
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_duration
  belongs_to :shipping_fee_responsibility
  
  #価格は、¥300~¥9,999,999の間のみ保存可能であること。
  validates :price, numericality: { 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9999999 
  }

  #価格は半角数値のみ保存可能であること。
  validates :price, numericality: { only_integer: true }



  #空の投稿を保存できないようにする
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_duration_id, presence: true
  validates :shipping_fee_responsibility_id, presence: true


  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_duration_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_responsibility_id, numericality: { other_than: 1, message: "can't be blank" }


  def sold?
    order.present?
  end



end
