class Admin::OrdersController < ApplicationController
  def edit
    
  end

  def update
    
  end

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    
  end

  private
  def order_params
  	params.require(:order).permit(:member_id, :order_status, :created_at)
  end
end
