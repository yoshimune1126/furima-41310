class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all
    @item = Item.order(created_at: :desc)
  end


  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params) 
    if @item.save
      redirect_to root_path  # ここでトップページにリダイレクト
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :price, :image, :category_id, :condition_id, :prefecture_id, :shipping_duration_id, :shipping_fee_responsibility_id,).merge(user_id: current_user.id)
  end


end
