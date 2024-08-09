require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
  context '商品出品できる場合' do

    it 'image, item_name, item_description, price, category_id, condition_id, prefecture_id, shipping_duration_id, shipping_fee_responsibility_idがあれば出品できる' do
      expect(@item).to be_valid
    end

  end
    
  context '商品出品できない場合' do

    it 'imageが空では出品できない' do
      @item.image = nil  
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'item_nameが空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it 'item_descriptionが空では出品できない' do
      @item.item_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
    end

    it 'priceが空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'category_idが---では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'condition_idが---では出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'shipping_fee_responsibility_idが---では出品できない' do
      @item.shipping_fee_responsibility_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee responsibility can't be blank")
    end

    it 'prefecture_idが---では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'shipping_duration_idが---では出品できない' do
      @item.shipping_duration_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping duration can't be blank")
    end

    it 'priceが¥300以下では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが¥10,000,000以上では出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'priceが半角数値以外では出品できない' do
      @item.price = '近藤'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'ユーザーが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end













  end
end
end













