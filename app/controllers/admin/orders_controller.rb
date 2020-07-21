class Admin::OrdersController < ApplicationController
  def edit
    
  end

  def update
    
  end

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
  	params.require(:order).permit(:member_id, :order_status, :postal_code, :receiver, :address, :postage, :payment_method, :total, :created_at, :updated_at)
  end
end
