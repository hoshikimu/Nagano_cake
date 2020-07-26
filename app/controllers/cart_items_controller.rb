class CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.new
    @total = 0
    @tax = 1.1
    @cart_item_member = CartItem.where(member_id: current_member.id)
    member = Member.find(params[:member_id])
    unless member.id == current_member.id
      redirect_to member_cart_items_path(current_member)
    end
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    respond_to do |format|
      if cart_item.save
          format.html { redirect_to item_path(cart_item.item_id), notice: "カートに保存されました。" }
      else
          format.html { redirect_to item_path(cart_item.item_id), notice: "1個以上を選択して下さい。" }
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to action: 'index'
    else
      @cart_items = CartItem.all
      @total = 0
      @tax = 1.1
      @cart_item_member = CartItem.where(member_id: current_member.id)
      @member = Member.find(params[:member_id])
      render :index
    end
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
    params.require(:cart_item).permit(:quantity, :item_id).merge(member_id: current_member.id)
  end

end