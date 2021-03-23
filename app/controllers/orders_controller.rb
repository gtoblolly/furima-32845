class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_addres = OrderAddres.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_addres = OrderAddres.new(order_params)
    if @order_addres.valid?
      pay_item
      @order_addres.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_addres).permit(:postcode, :area_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
  end

end