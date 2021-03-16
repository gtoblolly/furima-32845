class OrdersController < ApplicationController

  def index
    @order_addres = OrderAddres.new
  end

  def create
    @order_addres = OrderAddres.new(order_params)
    if @order_addres.valid?
      @order_addres.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_addres).permit(:postcode, :area_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end