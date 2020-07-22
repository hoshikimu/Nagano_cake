class Admin::OrdersController < ApplicationController
  def edit
    
  end

  def update
    
  end

  def index
    @orders = Order.page(params[:page]).reverse_order
    @order_item =OrderItem.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  private
  def order_params
    params.require(:order).permit(:member_id, :order_status, :postal_code,
     :receiver, :address, :postage, :payment_method, :total, :created_at, :updated_at,
     order_items_attributes: [:order_id, :item_id, :quantity, :tax_inculuded_price, :production_status],
     members_attributes: [:name_family, :name_first ])
  end
end
