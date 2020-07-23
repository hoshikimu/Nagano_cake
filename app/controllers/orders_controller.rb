class OrdersController < ApplicationController

  before_action :destroy_all, only: [:completion]

  def index
  	@member = Member.find(params[:member_id])
  	@orders = @member.orders
    # @orders = Order.page(params[:page]).reverse_order
    @order_items = OrderItem.all
  end

  def create
    if current_member.cart_items.exists?
      @order = Order.new(order_params)
      @order.member_id = current_member.id

      # 住所のラジオボタン選択に応じて引数を調整
      @add = params[:order][:add].to_i
      case @add
        when 1
          @order.postal_code = @member.postal_code
          @order.shipping = @member.address
          @order.receiver = full_name(@member)
        when 2
          @order.postal_code = params[:order][:postal_code]
          @order.shipping = params[:order][:address]
          @order.receiver = params[:order][:receiver]
        when 3
          @order.postal_code = params[:order][:postal_code]
          @order.shipping = params[:order][:address]
          @order.receiver = params[:order][:receiver]
      end

      @order.save
      # shippingで住所モデル検索、該当データなければ新規作成
      if Shipping.find_by(address: @order.address).nil?
        @address = Shipping.new
        @address.postal_code = @order.postal_code
        @address.address = @order.address
        @address.receiver = @order.receiver
        @address.member_id = current_member.id
        @address.save
      end

      # cart_itemsの内容をorder_itemsに新規登録
      current_member.cart_items.each do |cart_item|
        order_item = @order.order_items.build
        order_item.order_id = @order.id
        order_item.item_id = cart_item.item_id
        order_item.quantity = cart_item.quantity
        order_item.tax_inculuded_price = cart_item.item.price
        order_item.save
        cart_item.destroy #order_itemに情報を移したらcart_itemは消去
      end

      render :completion
    else
      redirect_to member_top_path, danger: 'カートが空です。'
    end
  end

  def show
    @order = Order.find(params[:id])
    if @order.member_id != current_member.id
      redirect_back(fallback_location: root_path)
      flash[:alert] = "アクセスに失敗しました。"
    end
  end

  def new
    @order = Order.new
    
  end


  def confirm
    @order = Order.new
    @cart_items = current_member.cart_items
    @order.payment_method = params[:order][:payment_method]
    # 住所のラジオボタン選択に応じて引数を調整
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.postal_code = @member.postal_code
        @order.shipping = @member.address
        @order.receiver = @member.name_family + @member.name_first
      when 2
        @shipping_address = params[:order][:address].to_i
        @address = Shipping.find(@shipping_address)
        @order.postal_code = @address.postal_code
        @order.shipping = @address.address
        @order.receiver = @address.receiver
      when 3
        @order.postal_code = params[:order][:new_add][:postal_code]
        @order.shipping = params[:order][:new_add][:address]
        @order.receiver = params[:order][:new_add][:receiver]
    end
  end

  def about
    @total = 0
    @shipping_cost = 800
    @cart_items_member = CartItem.where(member_id: current_member.id)
    @member = Member.find(params[:member_id])
    @tax = 1.1
  end

  def completion

  end

  private
  def order_params
  	params.require(:order).permit(:member_id, :order_status, :postal_code,
  	 :receiver, :address, :postage, :payment_method, :total, :created_at, :updated_at,
  	 order_items_attributes: [:order_id, :item_id, :quantity, :tax_inculuded_price, :production_status])
  end

end
