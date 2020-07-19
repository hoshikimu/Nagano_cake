class OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  private
  def order_params
  	params.require(:order).permit(:member_id, :order_status, :created_at, :address, :total, :receiver, :postal_code)
  end

end
