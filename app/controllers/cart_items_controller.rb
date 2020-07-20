class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0

  end

  def create
    # @item = Item.find(params[:id])
    # @cart_item = CartItem.new(cart_item_params)
    # @cart_item.save
    # redirect_to action: 'index'
  end

  def update
    
  end

  def destroy
    # ShippingAddress.find_by(id: params[:id], member_id: params[:member_id]).destroy
    # redirect_to action: 'index'
  end

  def destroy_all
    # ShippingAddress.find(params[:member_id]).destroy
    # redirect_to action: 'index'
  end

  # private
  # params.require(:cart_item).permit(:quantity)

end