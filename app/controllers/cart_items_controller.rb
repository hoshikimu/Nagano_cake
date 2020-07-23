class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
    @tax = 1.1
    @cart_item_member = CartItem.where(member_id: current_member.id)
    @member = Member.find(params[:member_id])
  end

  def create
    # @item = Item.find(params[:id])
    # @cart_item = CartItem.new(cart_item_params)
    # @cart_item.save
    # redirect_to action: 'index'
  end

  def update
    CartItem.find(params[:id]).update(cart_item_params)
    redirect_to action: 'index'
  end

  def destroy
    CartItem.find_by(id: params[:id], member_id: params[:member_id]).destroy
    redirect_to action: 'index'
  end

  def destroy_all
    member = Member.find(params[:member_id])
    member.cart_items.destroy_all
    redirect_to action: 'index'
  end

  private
  def cart_item_params    
    params.require(:cart_item).permit(:quantity)
  end

end