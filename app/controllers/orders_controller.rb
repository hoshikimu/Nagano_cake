class OrdersController < ApplicationController

  before_action :current_member?
  before_action :destroy_all, only: [:completion]
  @@button_selected = ""

  def index
    @member = Member.find(params[:member_id])
    @orders = @member.orders
    # @orders = Order.page(params[:page]).reverse_order
    @order_items = OrderItem.all
    @total = 0
    @postage = 800
    # @time = Order.find(params[:member_id]).created_at.strftime("%Y/%m/%d")
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

    @@button_selected = params[:selected]
    case @@button_selected
    when "a"
      @postal_code = params[:postal_code]
      @address = params[:address]
      @receiver = params[:name_family] + params[:name_first]
    when "b"
      if params[:shipping_address].blank?
        flash[:danger] = "お届け先が未入力です。"
        @member_shipping_addresses = @member.shipping_addresses
        render :new
      else
        shipping_address_id = params[:shipping_address]
        @postal_code = @member.shipping_addresses.find(shipping_address_id).postal_code
        @address = @member.shipping_addresses.find(shipping_address_id).address
        @receiver = @member.shipping_addresses.find(shipping_address_id).receiver
      end
    when "c"
      if params[:p].blank? || params[:a].blank? || params[:r].blank?
        flash[:danger] = "お届け先が未入力です。"
        @member_shipping_addresses = @member.shipping_addresses
        render :new
      else
        @postal_code = params[:p]
        @address = params[:a]
        @receiver = params[:r]
      end
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

      if @@button_selected == "c"
        @shipping_address = ShippingAddress.new
        @shipping_address.member_id = params[:member_id]
        @shipping_address.postal_code = @order.postal_code
        @shipping_address.address = @order.address
        @shipping_address.receiver = @order.receiver
        @shipping_address.save
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
