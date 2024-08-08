class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :check_item_owner, only: [:edit, :update]
  before_action :redirect_if_sold, only: [:edit]


  def index
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


  def show
    @item = Item.find(params[:id])
  end



  def edit

  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    if current_user == @item.user
      if @item.destroy
      redirect_to root_path 
      end
    else
      redirect_to root_path
    end
  end



  
  private

  def redirect_if_sold
    if @item.sold?
      redirect_to root_path, alert: '売却済みの商品は編集できません。'
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_item_owner
    unless current_user == @item.user
      redirect_to root_path
    end
  end


  def item_params
    params.require(:item).permit(:item_name, :item_description, :price, :image, :category_id, :condition_id, :prefecture_id, :shipping_duration_id, :shipping_fee_responsibility_id,).merge(user_id: current_user.id)
  end


end
