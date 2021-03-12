class OrdersController < ApplicationController

  def index
    @order_addres = Order_addres.new
  end

  def create
    @order_addres = Order_addres.new(order_params)
  end

  private

  def order_params
    params.require(:order_addres).permit(:user_id, :item_id, :postcode, :shipping_id, :city, :block, :building, :phone_number, :order_id)
  end

end
