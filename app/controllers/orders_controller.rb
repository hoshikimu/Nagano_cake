class OrdersController < ApplicationController

  before_action :destroy_all, only: [:completion]

  def index
    @member = Member.find(params[:member_id])
    @orders = @member.orders
    # @orders = Order.page(params[:page]).reverse_order
    @order_items = OrderItem.all
    @total = 0
    @postage = 800
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
    @postage = 800
    if @order.member_id != current_member.id
      redirect_back(fallback_location: root_path)
      flash[:alert] = "アクセスに失敗しました。"
    end
  end

  def new

    @order_new = Order.new
    @member = Member.find(current_member.id)
    @member_shipping_addresses = @member.shipping_addresses

  end


  def confirm
    
  end

  def about
    @order_new = Order.new
    @order = Order.new
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
      if @shipping_addresses_id == nil
        @member = Member.find(current_member.id)
        @member_shipping_addresses = @member.shipping_addresses
        flash[:danger] = "登録済みの住所がありません。"
        render :new
      else
        @shipping_address_id = params[:shipping_address]
        @postal_code = @member.shipping_addresses.find(@shipping_address_id).postal_code
        @address = @member.shipping_addresses.find(@shipping_address_id).address
        @receiver = @member.shipping_addresses.find(@shipping_address_id).receiver
      end
    when "c"
      if @postal_code == nil || @address == nil || @receiver == nil
        @member = Member.find(current_member.id)
        @member_shipping_addresses = @member.shipping_addresses
        flash[:danger] = "お届け先が未記入です。"
        render :new
      else
        @postal_code = params[:p]
        @address = params[:a]
        @receiver = params[:r]
      end
    end
  end

  def create
    @order_new = Order.new(order_params)
    @order_new.member_id = current_member.id
    if @order_new.save
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
