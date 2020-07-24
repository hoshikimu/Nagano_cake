class Admin::OrdersController < ApplicationController
  def edit
    @production_status = OrderItem.production_status.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_item =OrderItem.find(params[:id])
    @order.update(order_params)
     flash[:notice] = "注文ステータスを更新しました！"
    redirect_to request.referer
  end

  def index
    @orders = Order.page(params[:page]).reverse_order
    @order_items =OrderItem.all
    @total_quantity = 0

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
    @postage = 800
end

  private
  def order_params
    params.require(:order).permit(:member_id, :order_status, :postal_code,
     :receiver, :address, :postage, :payment_method, :total, :created_at, :updated_at,
     order_items_attributes: [:order_id, :item_id, :quantity, :tax_inculuded_price, :production_status],
     members_attributes: [:name_family, :name_first ])
  end
end
