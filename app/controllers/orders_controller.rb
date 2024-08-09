class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index, :create]  
  before_action :redirect_if_sold, only: [:index, :create]



  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new  
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item  
      @order_form.save  
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller
    if @item.user == current_user
      redirect_to root_path, alert: '自身が出品した商品は購入できません。'
    end
  end

  def redirect_if_sold
    if @item.sold? 
      redirect_to root_path, alert: '売却済みの商品は購入できません。'
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],   
      currency: 'jpy'            
    )
  end



end
