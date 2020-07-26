class OrdersController < ApplicationController

  # before_action :destroy_all, only: [:completion]

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    if @order.member_id != current_member.id
      redirect_back(fallback_location: root_path)
      flash[:alert] = "アクセスに失敗しました。"
    end
  end

  def new
    @order_new = Order.new
    @order = Order.new
    @member = Member.find(current_member.id)
    @member_shipping_addresses = @member.shipping_addresses
  end


  def confirm
    
  end

  def about
    @order = Order.new
    @order.order_items.build
    @total = 0
    @shipping_cost = 800
    @cart_items_member = CartItem.where(member_id: current_member.id)
    @member = Member.find(params[:member_id])
    @tax = 1.1

    @payment_method_enum = params[:payment_method]
    case @payment_method_enum
    when "0"
      @payment_method = "銀行振込"
    when "1"
      @payment_method = "クレジットカード"
    end

    button_selected = params[:selected]
    case button_selected
    when "a"
      @postal_code = params[:postal_code]
      @address = params[:address]
      @receiver = params[:name_family] + params[:name_first]
    when "b"
      @shipping_address_id = params[:shipping_address]
      @postal_code = @member.shipping_addresses.find(@shipping_address_id).postal_code
      @address = @member.shipping_addresses.find(@shipping_address_id).address
      @receiver = @member.shipping_addresses.find(@shipping_address_id).receiver
    when "c"
      @postal_code = params[:p]
      @address = params[:a]
      @receiver = params[:r]
    end
    if @postal_code == nil || @address == nil || @receiver == nil || @shipping_address_id == nil
      flash[:danger] = "お届け先が未記入です。"
      render :new
    end

  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @cart_items_member = current_member.cart_items
    @tax = 1.1
    if @order.save
      @cart_items_member.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.id
        @order_item.quantity = cart_item.quantity
        @order_item.tax_included_price = (cart_item.item.price * @tax).floor.to_s(:delimited)
        @order_item.production_status = 0
        @order_item.save
      end
      redirect_to member_order_completion_path
    else
      @member = Member.find(current_member.id)
      @member_shipping_addresses = @member.shipping_addresses
      render :new
    end
  end

  def completion

  end

  private
  def order_params
  	params.require(:order).permit(:order_status, :postal_code, :receiver, :address, :postage, :payment_method, :total)
  end

end
